class AllotmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_allotment, only: %i[ show edit update destroy ]
  before_action :administrator, only: %i[ edit destroy ]

  def index
    @allotments = Allotment.all
  end

  def show
    @allotment_users = @allotment.allotment_users
    @allotment_user = AllotmentUser.find_by(member_id: current_user.id, allotment_id: @allotment.id)
    @owned_plants = OwnedPlant.where(allotment_id: @allotment.id)
  end

  def new
    @allotment = Allotment.new
    @owned_plants = current_user.owned_plants
  end

  def edit
  end

  def create
    @allotment = Allotment.new(allotment_params)
    if @allotment.save
      @allotment.owned_plants << OwnedPlant.find(params[:allotment][:owned_plant_ids]) if params[:allotment][:owned_plant_ids].present?
      redirect_to @allotment, notice: "Le potager a été créé avec succès."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def update
    if @allotment.update(allotment_params)
      redirect_to allotment_url(@allotment), notice: "Le potager a bien été modifié."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @allotment.destroy
    redirect_to allotments_url, notice: "Le potager a bien été supprimé."
  end

  private

  def set_allotment
    @allotment = Allotment.find(params[:id])
  end

  def allotment_params
    params.require(:allotment).permit(:admin_id, :name, :size, :description, :start_date, :end_date, owned_plant_ids: [])
  end

  def administrator
    unless current_user == @allotment.admin
      flash[:alert] = "Vous n'êtes pas autorisé à effectuer cette action."
      redirect_back(fallback_location: root_url)
    end
  end
end