class Term < ApplicationRecord
  belongs_to :school
  has_many :course_terms
  has_many :courses, through: :course_terms
  has_many :licenses
  has_many :registrations, as: :registrationable
  scope :active, -> { where(active: true) }

  def generate_license
    license_code = SecureRandom.hex(10)
    self.licenses.create(code: license_code)
  end
end
