class AllotmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_allotment, only: %i[ show edit update destroy ]
  before_action :administrator, only: %i[ edit destroy ]

  # GET /allotments or /allotments.json
  def index
    @allotments = Allotment.all
  end

  # GET /allotments/1 or /allotments/1.json
  def show
    @allotment_users = @allotment.allotment_users
  end

  # GET /allotments/new
  def new
    @allotment = Allotment.new
  end

  # GET /allotments/1/edit
  def edit
  end

  # POST /allotments or /allotments.json
  def create
    @allotment = Allotment.new(allotment_params)

    respond_to do |format|
      if @allotment.save
        format.html { redirect_to allotment_url(@allotment), notice: "Le potager a bien été créé." }
        format.json { render :show, status: :created, location: @allotment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @allotment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /allotments/1 or /allotments/1.json
  def update
    respond_to do |format|
      if @allotment.update(allotment_params)
        format.html { redirect_to allotment_url(@allotment), notice: "Le potager a bien été modifié." }
        format.json { render :show, status: :ok, location: @allotment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @allotment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /allotments/1 or /allotments/1.json
  def destroy
    @allotment.destroy

    respond_to do |format|
      format.html { redirect_to allotments_url, notice: "Le potager a bien été supprimé." }
      format.json { head :no_content }
    end
  end

  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_allotment
    @allotment = Allotment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def allotment_params
    params.require(:allotment).permit(:size, :name, :description, :start_date, :end_date, :admin_id)
  end

  def administrator
    unless current_user == @allotment.admin
      flash[:alert] = "Vous n'êtes pas autorisé à effectuer cette action."
      redirect_back(fallback_location: root_url)
    end
  end  
end
