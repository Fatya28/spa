# frozen_string_literal: true

class ReviewsController < ApplicationController
  def create
    @order = Order.find(params[:order_id])

    @review = @order.create_review(review_params)
    redirect_to order_path(@order)
  end

  private

  def review_params
    params.require(:review).permit(:order_id, :user_id, :status, :rating, :comment)
  end
end
