class CourseTerm < ApplicationRecord
  belongs_to :course
  belongs_to :term
  has_many :registrations, as: :registrationable

  def course_name
    "#{term.name} - #{course.name}"
  end
end
