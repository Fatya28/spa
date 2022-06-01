class OrderReviewsController < ApplicationController
    def create
      @order = Order.find(params[:order_id])

      @review = @order.create_order_review(review_params)
      redirect_to order_path(@order)
    end

    private
      def review_params
        params.require(:order_review).permit(:order_id, :user_id, :status, :rating, :comment)
      end
end
