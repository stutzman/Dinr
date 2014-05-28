class Review < ActiveRecord::Base

  validates :score,
            presence: true

  validates_inclusion_of :score, in: 1..10

  validates :comment,
            presence: true

end