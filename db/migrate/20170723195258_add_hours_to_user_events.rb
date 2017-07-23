class AddHoursToUserEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :user_events, :hours, :integer
  end
end
