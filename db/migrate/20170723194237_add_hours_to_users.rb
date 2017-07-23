class AddHoursToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :hours, :integer
    add_column :users, :is_verified, :boolean, default: false
  end
end
