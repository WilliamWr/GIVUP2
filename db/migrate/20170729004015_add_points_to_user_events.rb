class AddPointsToUserEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :user_events, :points, :integer
  end
end
