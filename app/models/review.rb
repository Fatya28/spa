# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :order

  validates :rating, presence: true

  enum status: %i[fresh unblock block]

  after_update :update_status, if: Proc.new { |review| review.unblock? }
    def update_status
      review = Review.find(self.id)
      master = User.find(review.order.master_id)

        if master.rating == 0
          new_rating = review.rating
        else
          new_rating = (master.rating.to_i + review.rating)/2
        end
        master.update(rating: new_rating)
    end
end
