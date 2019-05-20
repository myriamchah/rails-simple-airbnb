class FlatsController < ApplicationController
  before_action :set_current_flat
  def index
    @flats = Flat.all
  end

  def show
    set_current_flat
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to @flat
    else
      render :new
    end
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :description, :address, :price_per_night, :number_of_guests)
  end

  def set_current_flat
    if params[:id]
      @flat = Flat.find(params[:id])
    end
  end
end
