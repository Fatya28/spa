class ServiceReviewsController < ApplicationController
  def show
  end

  def create
    @service = Service.find(params[:id].service_id)
    @review = @service.service_reviews.create(comment_params)
    redirect_to order_path(@order)
  end

  private
    def review_params
      params.require(:service_review).permit(:service_id, :user_id, :status, :rating, :comment)
    end

end
