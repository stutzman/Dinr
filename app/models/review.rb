class CanOnlyReviewPastEvents < ActiveModel::Validator
  def validate(review)
    unless review.event.event_date < Date.today
      review.errors[:event_id] << "You can't review events that haven't happend yet!"
    end
  end
end

class Review < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with CanOnlyReviewPastEvents

  belongs_to :user
  belongs_to :event

  validates :score,
            presence: true

  validates_inclusion_of :score, in: 1..10

  validates :comment,
            presence: true

end




