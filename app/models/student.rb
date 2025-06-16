class Student < ApplicationRecord
  belongs_to :school
  has_many :registrations
  has_many :licenses, foreign_key: :redeemed_by_student_id
  belongs_to :user, optional: true
end
