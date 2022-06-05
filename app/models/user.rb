# frozen_string_literal: true

class User < ApplicationRecord
  has_one_attached :avatar, dependent: :destroy

  has_many :orders, dependent: :restrict_with_exception
  has_many :reviews, through: :orders, dependent: :restrict_with_exception

  validates :name, presence: true
  validates :birthday, comparison: { less_than:  Date.today.ago(18.years) }, if: :birthday?


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: %i[client master]

  after_initialize :set_default_role, if: :new_record?

  def orders
    Order.where('master_id = ? OR user_id = ?', id, id)
  end

  def reviews
    Review.joins(:order).where('master_id = ? OR user_id = ?', id, id)
  end

  def set_default_role
    self.role ||= :client
  end
end
