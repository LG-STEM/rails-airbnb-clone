class InstrumentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @instruments = Instrument.all

    if params[:search].nil?

    else
      unless params[:search][:name] == ""
        @instruments = Instrument.where(name: params[:search][:name])
      end

      unless params[:search][:start_date] == "" || params[:search][:end_date] == ""
        @instruments = @instruments.includes(:bookings).where("(bookings.start_date, bookings.end_date) OVERLAPS (?, ?)", params[:search][:start_date].to_date, params[:search][:end_date].to_date).references(:bookings)
      end

      @message = 'no results' if @instruments.empty?
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
