class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @instrument = Instrument.find(params[:instrument_id])
    @booking.user = current_user
    @booking.instrument = @instrument
    if @booking.save
      redirect_to instrument_booking_path(@instrument, @booking), notice: "Your bookings has been created..."
    else
      render 'instruments/show'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
