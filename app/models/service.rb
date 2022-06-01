# frozen_string_literal: true

class Service < ApplicationRecord
  has_one_attached :image, dependent: :destroy

  has_many :orders, dependent: :destroy
  has_many :reviews, through: :orders, dependent: :destroy

  enum performed: [:'on the coach', :'on the mat']
  enum duration: %i[1h 1.5h 2h]
end
