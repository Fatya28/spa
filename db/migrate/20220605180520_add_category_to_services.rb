# frozen_string_literal: true

class AddCategoryToServices < ActiveRecord::Migration[7.0]
  def change
    add_reference :services, :category, null: true, foreign_key: true
  end
end
