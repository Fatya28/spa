class DeletePhotoToServices < ActiveRecord::Migration[7.0]
  def change
    remove_column :services, :performed, :string
  end
end
