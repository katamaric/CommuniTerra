class PlantSittingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_plant_sitting, only: %i[ show edit update destroy ]

  def index
    @plant_sittings = PlantSitting.all
    @kept_plants = KeptPlant.includes(:plant_sitting).where(plant_sitting_id: nil).where("end_date >= ?", Date.today).group_by { |kept_plant| kept_plant.owned_plant.user_id }
  end  

  def show
    @plant_sittings = PlantSitting.includes(:sitter, :asker).where(sitter_id: current_user.id)
  end
  
  def new
    @plant_sitting = PlantSitting.new
  end

  def edit
  end

  def create
    kept_plants = KeptPlant.where(id: params[:kept_plant_ids])
    asker_id = kept_plants.first&.owned_plant&.user_id
  
    if kept_plants.all? { |kept_plant| kept_plant.plant_sitting.nil? }
      @plant_sitting = PlantSitting.new(sitter_id: current_user.id, asker_id: asker_id)
  
      if @plant_sitting.save
        kept_plants.update_all(plant_sitting_id: @plant_sitting.id)
  
        redirect_to kept_plants_path, notice: 'Plant sitting was successfully created.'
      else
        render :new
      end
    else
      redirect_to plant_sittings_path, alert: 'Un ou plusieurs kept plants ont déjà un sitter assigné.'
    end
  end
  
  
  def update
    respond_to do |format|
      if @plant_sitting.update(plant_sitting_params)
        format.html { redirect_to plant_sitting_url(@plant_sitting), notice: "Le gardiennage a bien été modifié." }
        format.json { render :show, status: :ok, location: @plant_sitting }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @plant_sitting.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @plant_sitting.destroy

    respond_to do |format|
      format.html { redirect_to plant_sittings_url, notice: "Le gardiennage a bien été supprimé." }
      format.json { head :no_content }
    end
  end

  private
  
  def set_plant_sitting
    @plant_sitting = PlantSitting.find(params[:id])
  end

  def plant_sitting_params
    params.require(:plant_sitting).permit(:user_id, :kept_plant_id)
  end    
end
