# frozen_string_literal: true

class DeleteDescriptionFromServices < ActiveRecord::Migration[7.0]
  def change
    remove_column :services, :description, :string
  end
end
