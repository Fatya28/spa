# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :service
  belongs_to :user

  validates :startdate, presence: true
  validates :master_id, presence: true

  enum status: %i[draft cancel confirm complete]

  enum role: %i[client master]
end
