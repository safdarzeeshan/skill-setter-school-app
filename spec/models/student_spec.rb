require 'rails_helper'

RSpec.describe Student, type: :model do
  it { should belong_to(:school) }
  it { should have_many(:registrations) }
  it { should have_many(:licenses).with_foreign_key('redeemed_by_student_id') }
end
