# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :services, dependent: :restrict_with_exception
end
