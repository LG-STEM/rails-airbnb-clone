class InstrumentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    if params[:search].nil? || params[:search][:name] == ""
      @instruments = Instrument.all
    else
      @instruments = Instrument.where(name: params[:search][:name])
      @message = 'We do not have that intrument.' if @instruments.empty?
    end
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
    params.require(:instrument).permit(:name, :price, :avaliablity, :description, :category, :photo)
  end

end
