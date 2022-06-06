# frozen_string_literal: true

class Service < ApplicationRecord
  validates :title, :performed, :description, :introduction, :image, presence: true
  validates :title, uniqueness: true

  has_one_attached :image, dependent: :destroy

  has_many :orders, dependent: :restrict_with_exception
  has_many :reviews, through: :orders, dependent: :restrict_with_exception
  belongs_to :category

  enum performed: [:'on the coach', :'on the mat']
  enum duration: %i[1h 1.5h 2h]
end
