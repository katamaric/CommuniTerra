class PlantMoodsController < ApplicationController
  before_action :set_plant_mood, only: %i[ show edit update destroy ]

  # GET /plant_moods or /plant_moods.json
  def index
    @plant_moods = PlantMood.all
  end

  # GET /plant_moods/1 or /plant_moods/1.json
  def show
  end

  # GET /plant_moods/new
  def new
    @plant_mood = PlantMood.new
  end

  # GET /plant_moods/1/edit
  def edit
  end

  # POST /plant_moods or /plant_moods.json
  def create
    @plant_mood = PlantMood.new(plant_mood_params)

    respond_to do |format|
      if @plant_mood.save
        format.html { redirect_to plant_mood_url(@plant_mood), notice: "Plant mood was successfully created." }
        format.json { render :show, status: :created, location: @plant_mood }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @plant_mood.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plant_moods/1 or /plant_moods/1.json
  def update
    respond_to do |format|
      if @plant_mood.update(plant_mood_params)
        format.html { redirect_to plant_mood_url(@plant_mood), notice: "Plant mood was successfully updated." }
        format.json { render :show, status: :ok, location: @plant_mood }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @plant_mood.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plant_moods/1 or /plant_moods/1.json
  def destroy
    @plant_mood.destroy

    respond_to do |format|
      format.html { redirect_to plant_moods_url, notice: "Plant mood was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plant_mood
      @plant_mood = PlantMood.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def plant_mood_params
      params.require(:plant_mood).permit(:plant_mood)
    end
end
