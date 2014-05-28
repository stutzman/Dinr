class Review < ActiveRecord::Base

  belongs_to :user
  belongs_to :event

  validates :score,
            presence: true

  validates_inclusion_of :score, in: 1..10

  validates :comment,
            presence: true

end