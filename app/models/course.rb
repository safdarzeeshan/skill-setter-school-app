class Course < ApplicationRecord
  belongs_to :school
  has_many :course_terms
  has_many :terms, through: :course_terms
end
