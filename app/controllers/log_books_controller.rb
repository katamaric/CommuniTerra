class LogBooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_owned_plant
  before_action :set_log_book, only: [:edit, :update, :destroy]


  def index
    @owned_plant = OwnedPlant.find(params[:owned_plant_id])
    @log_books = @owned_plant.log_books
  end

  def show
    @log_book = LogBook.find(params[:id])
  end
  

  def new
    @log_book = @owned_plant.log_books.build
  end

  def create
    @log_book = @owned_plant.log_books.build(log_book_params)
    if @log_book.save
      redirect_to dashboard_index_url, notice: "L'entrée du journal de bord a été créée avec succès."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @log_book.update(log_book_params)
      redirect_to dashboard_index_url, notice: "L'entrée du journal de bord a été mise à jour avec succès."
    else
      render :edit
    end
  end

  def destroy
    @log_book.destroy
    redirect_to @owned_plant, notice: "L'entrée du journal de bord a été supprimée avec succès."
  end

  private

  def set_owned_plant
    @owned_plant = OwnedPlant.find(params[:owned_plant_id])
  end

  def set_log_book
    @log_book = @owned_plant.log_books.find(params[:id])
  end

  def log_book_params
    params.require(:log_book).permit(:entry_date, :title, :content)
  end
end
