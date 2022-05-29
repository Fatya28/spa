# frozen_string_literal: true

class Service < ApplicationRecord
  has_one_attached :image

  has_many :orders, dependent: :destroy

  enum performed: [:'on the coach', :'on the mat']
  enum duration: %i[1h 1.5h 2h]
end
