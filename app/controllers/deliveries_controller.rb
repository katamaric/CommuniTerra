class DeliveriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_delivery, only: %i[ show edit update destroy ]

  def index
    @deliveries = Delivery.all
  end

  def show
  end

  def new
    @delivery = Delivery.new
  end

  def edit
  end

  def create
    @delivery = Delivery.new(delivery_params)

    if @delivery.save
      redirect_to delivery_url(@delivery), notice: "La livraison a été créée avec succès."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @delivery.update(delivery_params)
      redirect_to delivery_url(@delivery), notice: "La livraison a été mise à jour avec succès."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @delivery.destroy
    redirect_to deliveries_url, notice: "La livraison a été supprimée avec succès."
  end

  private

  def set_delivery
    @delivery = Delivery.find(params[:id])
  end

  def delivery_params
    params.require(:delivery).permit(:delivery_type, :delivery_price, :delivery_provider)
  end
end