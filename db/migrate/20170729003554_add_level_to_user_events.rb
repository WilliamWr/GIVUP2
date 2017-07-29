class AddLevelToUserEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :user_events, :level, :integer

  end
end
