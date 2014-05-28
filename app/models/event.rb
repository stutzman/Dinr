class Event < ActiveRecord::Base

  validates :title, 
            presence: true

  validates :location, 
            presence: true

  validates :guest_number, 
            presence: true

  validates :attire, 
            presence: true

  validates :event_date, 
            presence: true

  validates :start_time, 
            presence: true

  validates :end_time, 
            presence: true

  validates :food_bio, 
            presence: true

end