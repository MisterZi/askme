class AddBackgroundColorToUser < ActiveRecord::Migration
  def change
    add_column :users, :background_color, :string
  end
end
