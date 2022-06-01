class CreateOrderReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :order_reviews do |t|
      t.belongs_to :order
      t.integer :rating
      t.integer :status
      t.text :comment

      t.timestamps
    end
  end
end
