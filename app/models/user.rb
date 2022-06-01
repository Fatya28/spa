# frozen_string_literal: true

class User < ApplicationRecord
  has_one_attached :avatar, dependent: :destroy

  has_many :orders, dependent: :destroy
  has_many :reviews, through: :orders, dependent: :destroy

  validates :name, presence:true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: %i[client master]

  after_initialize :set_default_role, if: :new_record?

  def orders
    Order.where("master_id = ? OR user_id = ?", self.id, self.id)
  end

  def reviews
    Review.joins(:order).where("master_id = ? OR user_id = ?", self.id, self.id)
  end

  def set_default_role
    self.role ||= :client
  end

end
