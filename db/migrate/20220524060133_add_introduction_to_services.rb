class AddIntroductionToServices < ActiveRecord::Migration[7.0]
  def change
    add_column :services, :introduction, :string
  end
end
