class AllotmentUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_allotment_user, only: %i[ show edit update destroy ]

  def index
    @allotment_users = AllotmentUser.all
  end

  def show
  end

  def new
    @allotment_user = AllotmentUser.new
  end

  def edit
  end

  def create
    @allotment_user = AllotmentUser.new(allotment_user_params)

    if @allotment_user.allotment.allotment_users.exists?(member_id: @allotment_user.member_id)
      redirect_to allotment_path(@allotment_user.allotment), alert: "Vous êtes déjà membre de ce potager."
      return
    end

    if @allotment_user.save
      redirect_to allotment_url(@allotment_user.allotment), notice: "Vous avez bien été ajouté.e au potager."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @allotment_user.update(allotment_user_params)
      redirect_to allotment_user_url(@allotment_user), notice: "Votre participation a bien été modifiée."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @allotment_user.destroy
    redirect_to allotments_url, notice: "Vous avez bien été retiré.e du potager."
  end

  private

  def set_allotment_user
    @allotment_user = AllotmentUser.find(params[:id])
  end

  def allotment_user_params
    params.permit(:allotment_id, :member_id)
  end       
end