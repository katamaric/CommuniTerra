class AllotmentUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_allotment_user, only: %i[ show edit update destroy ]

  # GET /allotment_users or /allotment_users.json
  def index
    @allotment_users = AllotmentUser.all
  end

  # GET /allotment_users/1 or /allotment_users/1.json
  def show
  end

  # GET /allotment_users/new
  def new
    @allotment_user = AllotmentUser.new
  end

  # GET /allotment_users/1/edit
  def edit
  end

  # POST /allotment_users or /allotment_users.json
  def create
    @allotment_user = AllotmentUser.new(allotment_user_params)

    if @allotment_user.allotment.allotment_users.exists?(member_id: @allotment_user.member_id)
      redirect_to allotment_path(@allotment_user.allotment), alert: "Vous êtes déjà membre de ce potager."
      return
    end

    respond_to do |format|
      if @allotment_user.save
        format.html { redirect_to allotment_url(@allotment_user.allotment), notice: "Vous avez bien été ajouté.e au potager." }
        format.json { render :show, status: :created, location: @allotment_user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @allotment_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /allotment_users/1 or /allotment_users/1.json
  def update
    respond_to do |format|
      if @allotment_user.update(allotment_user_params)
        format.html { redirect_to allotment_user_url(@allotment_user), notice: "Votre participation a bien été modifiée." }
        format.json { render :show, status: :ok, location: @allotment_user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @allotment_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /allotment_users/1 or /allotment_users/1.json
  def destroy
    @allotment_user.destroy

    respond_to do |format|
      format.html { redirect_to allotments_url, notice: "Vous avez bien été retiré.e du potager." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_allotment_user
      @allotment_user = AllotmentUser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def allotment_user_params
      params.require(:allotment_user).permit(:allotment_id, :member_id)
    end    
end
