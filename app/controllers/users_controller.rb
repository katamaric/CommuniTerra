class UsersController < ApplicationController
  before_action :require_login
  before_action :set_plant, only: %i[ show edit update destroy ]

  private

  def require_login
    unless user_signed_in? && current_user.admin?
      redirect_to root_url, alert: "Accès restreint. Vous devez être administrateur pour accéder à cette page."
    end
  end

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_url(@user), notice: "L'utilisateur a bien été créé."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_url(@user), notice: "L'utilisateur a bien été modifié."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: "L'utilisateur a bien été supprimé."
  end

  def admin?
    role == "admin"
  end

  private

  def set_user
    if params[:id] == "sign_out"
      @user = current_user
    else
      @user = User.find(params[:id])
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :phone_number, :birthdate, :bio)
  end
end