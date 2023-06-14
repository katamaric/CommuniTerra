class KeptPlantsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_kept_plant, only: %i[ show edit update destroy ]

  # GET /kept_plants or /kept_plants.json
  def index
    @kept_plants = current_user.kept_plants
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
    @kept_plant = KeptPlant.new(kept_plant_params)
    @kept_plant.user = current_user

    respond_to do |format|
      if @kept_plant.save
        format.html { redirect_to kept_plant_url(@kept_plant), notice: "La plante à garder a bien été ajoutée." }
        format.json { render :show, status: :created, location: @kept_plant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @kept_plant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kept_plants/1 or /kept_plants/1.json
  def update
    respond_to do |format|
      if @kept_plant.update(kept_plant_params)
        format.html { redirect_to kept_plant_url(@kept_plant), notice: "Kept plant was successfully updated." }
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
      format.html { redirect_to kept_plants_url, notice: "Kept plant was successfully destroyed." }
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
      params.require(:kept_plant).permit(:user_id, :owned_plant_id, :title, :quantity, :description)
    end
end
