class OwnedPlantsController < ApplicationController
  before_action :set_owned_plant, only: %i[ show edit update destroy ]

  def index
    @owned_plants = current_user.owned_plants
  end

  def show
    @owned_plant = current_user.owned_plants.find(params[:id])
  end

  def new
    @owned_plant = OwnedPlant.new
  end

  def edit
  end

  def create
    @owned_plant = OwnedPlant.new(owned_plant_params)
    @owned_plant.user = current_user

    quantity = owned_plant_params[:quantity].to_i

    if quantity.positive? && @owned_plant.save
      (quantity - 1).times do
        OwnedPlant.create(owned_plant_params.except(:quantity))
      end

      redirect_to dashboard_index_url, notice: "La plante possédée a bien été ajoutée."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @owned_plant.update(owned_plant_params)
      redirect_to dashboard_index_url, notice: "La plante possédée a bien été modifiée."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @owned_plant.destroy
    redirect_to dashboard_index_url, notice: "La plante possédée a bien été supprimée."
  end

  private

  def set_owned_plant
    @owned_plant = OwnedPlant.find(params[:id])
  end

  def owned_plant_params
    params.require(:owned_plant).permit(:plant_id, :quantity, :nickname, :description).merge(user_id: current_user.id)
  end
end