class KeptPlantsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_kept_plant, only: %i[ show edit update destroy ]

  # GET /kept_plants or /kept_plants.json
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @kept_plants = @user.kept_plants
    else
      @kept_plants = current_user.kept_plants
    end
    
    if params[:user_id] && params[:start_date] && params[:end_date]
      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date])
      @kept_plants = @kept_plants.where(start_date: start_date, end_date: end_date)
    end
  end

  # GET /kept_plants/1 or /kept_plants/1.json
  def show
  end

  # GET /kept_plants/new
  def new
    @kept_plant = KeptPlant.new
    @owned_plants = current_user.owned_plants
  end

  # GET /kept_plants/1/edit
  def edit
  end

  # POST /kept_plants or /kept_plants.json
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
        if existing_kept_plant
          # Rajouter le message d'erreur
        else
          @kept_plants << KeptPlant.new(kept_plant_params_with_attributes)
        end
      end
    end    
  
    plantlist_number = KeptPlant.maximum(:plantlist_number).to_i + 1
    @kept_plants.each { |kept_plant| kept_plant.plantlist_number = plantlist_number }
  
    respond_to do |format|
      if @kept_plants.all?(&:save)
        format.html { redirect_to kept_plants_url, notice: "Les plantes à garder ont été ajoutées avec succès." }
        format.json { render :index, status: :created, location: kept_plants_url }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @kept_plants.map(&:errors), status: :unprocessable_entity }
      end
    end
  end
  
  
  

  # PATCH/PUT /kept_plants/1 or /kept_plants/1.json
  def update
    respond_to do |format|
      if @kept_plant.update(kept_plant_params)
        format.html { redirect_to kept_plant_url(@kept_plant), notice: "Les plantes à garder ont bien été modifiées." }
        format.json { render :show, status: :ok, location: @kept_plant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @kept_plant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kept_plants/1 or /kept_plants/1.json
  def destroy
    @kept_plant.destroy

    respond_to do |format|
      format.html { redirect_to kept_plants_url, notice: "Les plantes à garder ont bien été supprimées." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_kept_plant
    @kept_plant = KeptPlant.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def kept_plant_params
    params.require(:kept_plant).permit(:user_id, :quantity, :description, :start_date, :end_date, owned_plant_id: [])
  end    
end
