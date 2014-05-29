class Event < ActiveRecord::Base

  has_many :commits
  has_many :reviews
  has_many :attending_users, through: :commits, source: :user
  belongs_to :user
  belongs_to :category

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

  def self.future_events
    Event.where("event_date >= ?", Date.today)
  end
  def self.past_events
    Event.where("event_date < ?", Date.today)
  end

end



