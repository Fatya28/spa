class DeleteRatingFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :rating
  end
end
