# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :service
  belongs_to :user, class_name: 'User'
  belongs_to :master, class_name: 'User'
  has_one :review, dependent: :restrict_with_exception

  validates :startdate, presence: true

  STATUSES = %i[draft cancel confirm complete].freeze

  enum status: STATUSES

  enum role: %i[client master]

  scope :status, ->(status) { where('status = ?', status) }
end
