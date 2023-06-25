class KeptPlantsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_kept_plant, only: %i[ show edit update destroy ]

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @kept_plants = @user.owned_plants.map(&:kept_plants).flatten
    else
      @kept_plants = current_user.owned_plants.map(&:kept_plants).flatten
    end
    
    if params[:user_id] && params[:start_date] && params[:end_date]
      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date])
      @kept_plants = @kept_plants.select { |kept_plant| kept_plant.start_date == start_date && kept_plant.end_date == end_date }
    end
  
    @current_user_plant_sittings = current_user.plant_sittings.includes(:kept_plants)
  end

  def show
  end

  def new
    @kept_plant = KeptPlant.new
    @owned_plants = current_user.owned_plants
  end

  def edit
  end

  def create
    @owned_plants = current_user.owned_plants
    @kept_plants = []
  
    @owned_plants.each do |owned_plant|
      if params[:kept_plant] && params[:kept_plant][:owned_plant_id].include?(owned_plant.id.to_s)
        kept_plant_params_with_attributes = kept_plant_params.merge(
          owned_plant_id: owned_plant.id,
          description: params[:kept_plant][:description],
          start_date: params[:kept_plant][:start_date],
          end_date: params[:kept_plant][:end_date]
        )
  
        existing_kept_plant = KeptPlant.find_by(owned_plant_id: owned_plant.id)
  
        if existing_kept_plant && existing_kept_plant.start_date == kept_plant_params_with_attributes[:start_date] && existing_kept_plant.end_date == kept_plant_params_with_attributes[:end_date]
          redirect_to kept_plants_url, alert: "Une même plante à garder sur ces dates existe déjà."
          return
        else
          @kept_plants << KeptPlant.new(kept_plant_params_with_attributes)
        end
      end
    end
  
    if @kept_plants.all?(&:save)
      redirect_to kept_plants_url, notice: "Les plantes à garder ont été ajoutées avec succès."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @kept_plant.update(kept_plant_params)
      redirect_to kept_plant_url(@kept_plant), notice: "Les plantes à garder ont bien été modifiées."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @kept_plant.nil?
      KeptPlant.where(start_date: params[:start_date], end_date: params[:end_date]).destroy_all
    else
      @kept_plant.destroy
    end
  
    redirect_to kept_plants_url, notice: "Les plantes à garder ont bien été supprimées."
  end  

  private

  def set_kept_plant
    if params[:id] == 'delete'
      @kept_plants = KeptPlant.where(start_date: params[:start_date], end_date: params[:end_date])
    else
      @kept_plant = KeptPlant.find(params[:id])
    end
  end  

  def kept_plant_params
    params.require(:kept_plant).permit(:quantity, :description, :start_date, :end_date, owned_plant_id: [])
  end    
end