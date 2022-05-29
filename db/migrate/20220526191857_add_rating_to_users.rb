# frozen_string_literal: true

class AddRatingToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :rating, :string, default: 0
  end
end
