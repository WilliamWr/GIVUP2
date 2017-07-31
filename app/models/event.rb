class Event < ApplicationRecord

  has_many :user_events
  geocoded_by :full_street_address   # can also be an IP address
  # has_many :users, through: :user_events

  def hours(user_id)
    return self.user_events.find_by(user_id: user_id).hours || 0
  end

end
