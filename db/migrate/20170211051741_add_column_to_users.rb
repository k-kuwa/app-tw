class AddColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :image, :string
    add_column :users, :text, :string, limit: 140
  end
end
