# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :service
  belongs_to :user, class_name: 'User'
  belongs_to :master, class_name: 'User'
  has_one :review, dependent: :destroy

  validates :startdate, presence: true
  

  STATUSES = %i[draft cancel confirm complete]

  enum status: STATUSES

  enum role: %i[client master]

  scope :status, ->(status) { where('status = ?', status) }
end
