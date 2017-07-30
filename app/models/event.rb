class Event < ApplicationRecord

  has_many :user_events
  geocoded_by :full_street_address   # can also be an IP address
  # has_many :users, through: :user_events

end
