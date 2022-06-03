# frozen_string_literal: true

class ReviewsController < ApplicationController
  def create
    @order = Order.find(params[:order_id])

    @review = @order.create_review(review_params)
    redirect_to order_path(@order)
    @master = User.find(@order.master_id)

    if @master.rating == 0
      @new_rating = @review.rating
    else
      @new_rating = (@master.rating.to_i + @review.rating)/2
    end

    @master.update(rating: @new_rating)
  end

  private

  def review_params
    params.require(:review).permit(:order_id, :user_id, :status, :rating, :comment)
  end
end
