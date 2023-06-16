class UsersController < ApplicationController
  before_action :require_login
  before_action :set_plant, only: %i[ show edit update destroy ]

  private

  def require_login
    unless user_signed_in? && current_user.admin?
      redirect_to root_url, alert: "Accès restreint. Vous devez être administrateur pour accéder à cette page."
    end
  end

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "L'utilisateur a bien été créé." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "L'utilisateur a bien été modifié." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "L'utilisateur a bien été supprimé." }
      format.json { head :no_content }
    end
  end

  def admin?
    role == "admin"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      if params[:id] == "sign_out"
        @user = current_user
      else
        @user = User.find(params[:id])
      end
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :phone_number, :birthdate, :bio)
    end
end
