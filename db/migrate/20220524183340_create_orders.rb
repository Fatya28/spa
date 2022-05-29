# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :service, foreign_key: true
      t.integer :status
      t.date :startdate
      t.timestamps
    end
  end
end
