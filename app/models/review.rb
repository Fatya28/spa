# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :order

  validates :rating, presence: true

  enum status: %i[fresh unblock block]

  after_update :get_review_id, :update_rating, if: Proc.new { |review| review.unblock? }
  before_destroy :get_review_id
  after_destroy :update_rating

  def get_review_id
    review = Review.find(self.id)
    master = User.find(review.order.master_id)
    service = Service.find(review.order.service_id)
    @changes = [master, service]
  end

  def update_rating

    @changes.each do |value|
      new_rating = value.reviews.average(:rating)
      value.update(rating: new_rating)
    end
  end
end
