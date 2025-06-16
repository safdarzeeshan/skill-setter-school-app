class License < ApplicationRecord
  belongs_to :term
  belongs_to :redeemed_by_student, class_name: "Student", optional: true
  has_one :registration

end
