class PlantSittingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_plant_sitting, only: %i[ show edit update destroy ]

  # GET /plant_sittings or /plant_sittings.json
  def index
    @plant_sittings = PlantSitting.all
    @kept_plants = KeptPlant.where("end_date >= ?", Date.today).group_by { |kept_plant| kept_plant.owned_plant.user_id }
  end  

  # GET /plant_sittings/1 or /plant_sittings/1.json
  def show
    @plant_sittings = PlantSitting.includes(:sitter, :asker).where(sitter_id: current_user.id)
  end

  def index_current_user
    @plant_sittings_as_asker = PlantSitting.includes(:sitter, :asker).where(asker_id: current_user.id)
    @plant_sittings_as_sitter = PlantSitting.includes(:sitter, :asker).where(sitter_id: current_user.id)
  end
  
  # GET /plant_sittings/new
  def new
    @plant_sitting = PlantSitting.new
  end

  # GET /plant_sittings/1/edit
  def edit
  end

  # POST /plant_sittings or /plant_sittings.json
    def create
      kept_plants = KeptPlant.where(id: params[:kept_plant_ids])
      asker_id = kept_plants.first&.owned_plant&.user_id
  
      @plant_sitting = PlantSitting.new(sitter_id: current_user.id, asker_id: asker_id)
  
      if @plant_sitting.save
        # Associer le PlantSitting à chaque KeptPlant de la liste
        kept_plants.update_all(plant_sitting_id: @plant_sitting.id)
  
        redirect_to @plant_sitting, notice: 'Plant sitting was successfully created.'
      else
        render :new
      end
    end
  

  # PATCH/PUT /plant_sittings/1 or /plant_sittings/1.json
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

  # DELETE /plant_sittings/1 or /plant_sittings/1.json
  def destroy
    @plant_sitting.destroy

    respond_to do |format|
      format.html { redirect_to plant_sittings_url, notice: "Le gardiennage a bien été supprimé." }
      format.json { head :no_content }
    end
  end

  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_plant_sitting
    @plant_sitting = PlantSitting.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def plant_sitting_params
    params.require(:plant_sitting).permit(:user_id, :kept_plant_id)
  end    
end
