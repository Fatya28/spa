class RenameOrderReviewsToReviews < ActiveRecord::Migration[7.0]
  def change
    rename_table :order_reviews, :reviews
  end
end
