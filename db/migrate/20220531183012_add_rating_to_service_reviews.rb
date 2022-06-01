class AddRatingToServiceReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :service_reviews, :rating, :integer
  end
end
