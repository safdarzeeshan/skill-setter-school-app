class Registration < ApplicationRecord
  belongs_to :student
  belongs_to :registrationable, polymorphic: true
  belongs_to :payment
  
  accepts_nested_attributes_for :payment
  
  scope :active, -> { where(active: true) }
  scope :course_terms, -> { where( registrationable_type: 'CourseTerm')}
  scope :terms, -> { where( registrationable_type: 'Term')}
end
