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

        redirect_to kept_plants_path, notice: 'Le gardiennage a bien été créé.'
      else
        render :new
      end
    else
      redirect_to plant_sittings_path, alert: 'Une ou plusieurs plantes ont déjà un sitter assigné.'
    end
  end

  def update
    if @plant_sitting.update(plant_sitting_params)
      redirect_to plant_sitting_url(@plant_sitting), notice: "Le gardiennage a bien été modifié."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @plant_sitting.destroy
    redirect_to plant_sittings_url, notice: "Le gardiennage a bien été supprimé."
  end

  private

  def set_plant_sitting
    @plant_sitting = PlantSitting.find(params[:id])
  end

  def plant_sitting_params
    params.require(:plant_sitting).permit(:user_id, :kept_plant_id)
  end
end