  class OwnedPlantsController < ApplicationController
    before_action :set_owned_plant, only: %i[ show edit update destroy ]

    # GET /owned_plants or /owned_plants.json
    def index
      @owned_plants = current_user.owned_plants
    end

    # GET /owned_plants/1 or /owned_plants/1.json
    def show
      @owned_plant = current_user.owned_plants.find(params[:id])
    end    
    

    # GET /owned_plants/new
    def new
      @owned_plant = OwnedPlant.new
    end

    # GET /owned_plants/1/edit
    def edit
    end

  # POST /owned_plants or /owned_plants.json
  def create
    @owned_plants = current_user.owned_plants
    selected_owned_plant_ids = params[:kept_plant][:owned_plant_id] || []
  
    @kept_plants = @owned_plants.select { |owned_plant| selected_owned_plant_ids.include?(owned_plant.id.to_s) }
                               .map { |owned_plant| KeptPlant.new(kept_plant_params.merge(owned_plant_id: owned_plant.id)) }
  
    respond_to do |format|
      if @kept_plants.all?(&:save)
        format.html { redirect_to kept_plants_url, notice: "Les plantes à garder ont été ajoutées avec succès." }
        format.json { render :index, status: :created, location: kept_plants_url }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @kept_plants.map(&:errors), status: :unprocessable_entity }
      end
    end
  end
  
  
    
    # PATCH/PUT /owned_plants/1 or /owned_plants/1.json
    def update
      respond_to do |format|
        if @owned_plant.update(owned_plant_params)
          format.html { redirect_to dashboard_index_url, notice: "Owned plant was successfully updated." }
          format.json { render :show, status: :ok, location: @owned_plant }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @owned_plant.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /owned_plants/1 or /owned_plants/1.json
    def destroy
      @owned_plant.destroy

      respond_to do |format|
        format.html { redirect_to owned_plants_url, notice: "Owned plant was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_owned_plant
        @owned_plant = OwnedPlant.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def owned_plant_params
        params.require(:owned_plant).permit(:user_id, :plant_id, :quantity, :nickname)
      end
  end
