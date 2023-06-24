class OwnedPlantsController < ApplicationController
  before_action :set_owned_plant, only: %i[ show edit update destroy ]

  # GET /owned_plants or /owned_plants.json
  def index
    @owned_plants = current_user.owned_plants
  end

  # GET /owned_plants/1 or /owned_plants/1.json
  def show
    @owned_plant = current_user.owned_plants.find(params[:id])
  end    
  

  # GET /owned_plants/new
  def new
    @owned_plant = OwnedPlant.new
  end

  # GET /owned_plants/1/edit
  def edit
  end

  # POST /owned_plants or /owned_plants.json
  def create
    @owned_plant = OwnedPlant.new(owned_plant_params)
    @owned_plant.user = current_user
  
    # Handle multiple plant entries based on the quantity
    quantity = owned_plant_params[:quantity].to_i
  
    if quantity.positive? && @owned_plant.save
      # Create additional entries for the same plant
      (quantity - 1).times do
        OwnedPlant.create(owned_plant_params.except(:quantity))
      end
  
      respond_to do |format|
        format.html { redirect_to dashboard_index_url, notice: "La plante possédée a bien été ajoutée." }
        format.json { render :show, status: :created, location: @owned_plant }
      end
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @owned_plant.errors, status: :unprocessable_entity }
      end
    end
  end
    
  # PATCH/PUT /owned_plants/1 or /owned_plants/1.json
  def update
    respond_to do |format|
      if @owned_plant.update(owned_plant_params)
        format.html { redirect_to dashboard_index_url, notice: "La plante possédée a bien été modifiée." }
        format.json { render :show, status: :ok, location: @owned_plant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @owned_plant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /owned_plants/1 or /owned_plants/1.json
  def destroy
    @owned_plant.destroy

    respond_to do |format|
      format.html { redirect_to dashboard_index_url, notice: "La plante possédée a bien été supprimée." }
      format.json { head :no_content }
    end
  end

  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_owned_plant
    @owned_plant = OwnedPlant.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def owned_plant_params
    params.require(:owned_plant).permit(:plant_id, :quantity, :nickname, :description).merge(user_id: current_user.id)
  end
end
