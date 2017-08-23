class InstrumentsController < ApplicationController
  def index
<<<<<<< HEAD
    @instruments = Instruments.where(name: params[:name])
=======
    @instruments = Instrument.where(category: params[:category])
>>>>>>> 6434c4b63128dd04a545a43e986746ec47bff0a6
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
<<<<<<< HEAD
    params.require(:instruments).permit(:name, :price, :avaliablity, :description, )
=======
    params.require(:instruments).permit(:name, :price, :avaliablity, :description, :category, :photo)
>>>>>>> 6434c4b63128dd04a545a43e986746ec47bff0a6
  end

end
