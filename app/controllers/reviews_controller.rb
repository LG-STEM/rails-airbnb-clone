class ReviewsController < ApplicationController
  before_action :set_instrument
  def new
    @review = Review.new
  end
  def create
    @review = Review.new(review_params)
    @review.instrument = @instrument
    @review.save
    redirect_to instrument_path(@instrument)
  end

  private
  def set_instrument
    @instrument = Instrument.find(params[:instrument_id])
  end
  def review_params
    params.require(:review).permit(:content)
  end
end
