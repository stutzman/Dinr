class Category < ActiveRecord::Base

  validates :genre, 
            presence: true,
            length: { maximum: 30 }

end