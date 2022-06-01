class Review < ApplicationRecord
  belongs_to :order

  validates :rating, presence:true

  enum status: %i[fresh unblock block]
end
