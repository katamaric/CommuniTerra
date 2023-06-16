class PlantsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_plant, only: %i[ show edit update destroy ]

  # GET /plants or /plants.json
  def index
    @plants = Plant.page(params[:page]).per(12)
    @q = Plant.ransack(params[:q])
    @plants = @q.result(distinct: true).page(params[:page]).per(12)
    @search = Plant.ransack(params[:q])
    @search.sorts = 'name asc' if @search.sorts.empty?
    @plants = @search.result.page(params[:page]).per(12)
  end

  # GET /plants/1 or /plants/1.json
  def show
    @plant = Plant.find_by(id: params[:id])
    
    if @plant.nil?
      redirect_to plants_path, alert: "La plante avec l'ID spécifié n'existe pas."
    end    
  end

  # GET /plants/new
  def new
    @plant = Plant.new
  end

  # GET /plants/1/edit
  def edit
  end

  # POST /plants or /plants.json
  def create
    @plant = Plant.new(plant_params)

    respond_to do |format|
      if @plant.save
        format.html { redirect_to plant_url(@plant), notice: "La plante a bien été créée." }
        format.json { render :show, status: :created, location: @plant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @plant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plants/1 or /plants/1.json
  def update
    respond_to do |format|
      if @plant.update(plant_params)
        format.html { redirect_to plant_url(@plant), notice: "La plante a bien été modifiée." }
        format.json { render :show, status: :ok, location: @plant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @plant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plants/1 or /plants/1.json
  def destroy
    @plant.destroy

    respond_to do |format|
      format.html { redirect_to plants_url, notice: "La plante a bien été supprimée." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plant
      @plant = Plant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def plant_params
      params.require(:plant).permit(:description, :common_name, :latin_name, :specie, :vegetation, :foliage, :mature_height, :mature_width, :maintenance_level, :maintenance_description, :water_requirement_level, :water_requirement_description, :cold_resistance_level, :cold_resistance_description, :density, :exposure_level, :exposure_description, :flowering, :planting, :harvest, :pruning)
    end
end
