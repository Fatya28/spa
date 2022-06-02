# frozen_string_literal: true

class DeletePhotonameFromServices < ActiveRecord::Migration[7.0]
  def change
    remove_column :services, :photoname
  end
end
