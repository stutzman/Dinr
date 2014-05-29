class User < ActiveRecord::Base

  has_many :events
  has_many :commits
  has_many :reviews

  validates :name, 
            presence: true

  validates :email, 
            presence: true, 
            uniqueness: true
  

  validates_format_of :email, 
  with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
  
  validates :password, 
            presence: true

  validates :city,
            presence: true

  validates :state_province,
            presence: true

  validates :country,
            presence: true

end