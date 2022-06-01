class CreateServiceReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :service_reviews do |t|
      t.belongs_to :service
      t.belongs_to :user
      t.text :comment
      t.integer :status

      t.timestamps
    end
  end
end
