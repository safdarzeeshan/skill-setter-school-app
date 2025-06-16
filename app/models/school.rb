class School < ApplicationRecord
  has_many :students
  has_many :school_admins
  has_many :terms
  has_many :courses
end
