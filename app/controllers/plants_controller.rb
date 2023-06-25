class PlantsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_plant, only: %i[ show edit update destroy ]

  def index
    @q = Plant.ransack(params[:q])
    @search = @q.result(distinct: true).order(common_name: :asc)
    @plants = @search.page(params[:page]).per(12)
  end

  def show
    if @plant.nil?
      redirect_to plants_path, alert: "La plante avec l'ID spécifié n'existe pas."
    end
  end

  def new
    @plant = Plant.new
  end

  def edit
  end

  def create
    @plant = Plant.new(plant_params)

    if @plant.save
      redirect_to plant_url(@plant), notice: "La plante a bien été créée."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @plant.update(plant_params)
      redirect_to plant_url(@plant), notice: "La plante a bien été modifiée."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @plant.destroy
    redirect_to plants_url, notice: "La plante a bien été supprimée."
  end

  private

  def set_plant
    @plant = Plant.find(params[:id])
  end

  def plant_params
    params.require(:plant).permit(:description, :common_name, :latin_name, :specie, :vegetation, :foliage, :mature_height, :mature_width, :maintenance_level, :maintenance_description, :water_requirement_level, :water_requirement_description, :cold_resistance_level, :cold_resistance_description, :density, :exposure_level, :exposure_description, :flowering, :planting, :harvest, :pruning)
  end
end