# frozen_string_literal: true

class User < ApplicationRecord
  has_one_attached :avatar

  has_many :orders, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: %i[client master]

  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :client
  end

  def fill_stars
    rating.to_i
  end

  def blank_stars
    5 - rating.to_i
  end
end
