class User < ActiveRecord::Base

  has_many :events
  has_many :commits
  has_many :reviews

  validates :name, 
            presence: true

  validates :email, 
            presence: true, 
            uniqueness: true
            #TO DO: VALIDATE E-MAIL
            #:email_format => {:message => 'is not looking good'}
  
  validates :password, 
            presence: true

  #CURRENTLY UNVALIDATED TO NOT IMPACT PREVIOUSLY ADDED DATABASE ITEMS
  # validates :city,
  #           presence: true

  # validates :state_province,
  #           presence: true

  # validates :country,
  #           presence: true

end