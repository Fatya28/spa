class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.string :photoname

      t.timestamps
    end
  end
end
