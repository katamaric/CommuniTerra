class PlantimgsController < ApplicationController
  def create
    @plant = Plant.find(params[:plant_id])
    @plant.plantimg.attach(params[:plantimg])
    redirect_to(plant_path(@plant))
  end
end
