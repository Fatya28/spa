# frozen_string_literal: true

class AddMasterIdToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :master_id, :integer
  end
end
