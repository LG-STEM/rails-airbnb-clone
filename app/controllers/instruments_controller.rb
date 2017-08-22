class InstrumentsController < ApplicationController
  def index
    @instruments = Instruments.where(category: params[:category])
  end

  def show
    @instrument = Instrument.find(params[:id])
    @booking = Booking.new # This line is so we can generate a simple form for booking
  end

  def new
    @instrument = Instrument.new
  end

  def create
    @instrument = Instrument.new(instrument_params)

    if @instrument.save
      redirect_to instrument_path(@instrument)
    else
      render :new
    end
  end

  private

  def instrument_params
    params.require(:instruments).permit(:name, :price, :avaliablity, :description, :category)
  end

end
