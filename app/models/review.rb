# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :order

  validates :rating, presence: true

  STATUSES = { :fresh => "Новый", :unblock => "Опубликован",  :block => "Заблокирован"}

  enum status: STATUSES.keys.freeze

  after_update :return_changes, :update_rating # , if: proc { |review| review.unblock? }
  before_destroy :return_changes
  after_destroy :update_rating

  def return_changes
    review = Review.find(id)
    master = User.find(review.order.master_id)
    service = Service.find(review.order.service_id)
    @changes = [master, service]
  end

  def update_rating
    @changes.each do |value|
      new_rating = value.reviews.unblock.average(:rating)
      new_rating ||= 0
      value.update(rating: new_rating)
    end
  end
end
