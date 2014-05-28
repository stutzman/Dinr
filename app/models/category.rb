class Category < ActiveRecord::Base

  has_many :events

  validates :genre, 
            presence: true,
            length: { maximum: 30 }

end