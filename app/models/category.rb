class Category < ActiveRecord::Base

  validates :type, 
            presence: true,
            length: { maximum: 30 }

end