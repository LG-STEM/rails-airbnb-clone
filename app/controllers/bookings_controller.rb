class BookingsController < ApplicationController
  def preload
    instrument = Instrument.find(params[:instrument_id])
    today = Date.today
    bookingss = instrument.bookings.where("start_date >= ? OR end_date >= ?", today, today)
  end

  def create
    @booking = current_user.bookings.create(bookings_params)

    redirect_to @bookings.room, notice: "Your bookings has been created..."
  end

  private

  def bookings_params
    params.require(:bookings).permit(:start_date, :end_date, :price, :user_id, :instrument_id)
  end
end
