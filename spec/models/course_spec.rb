require 'rails_helper'

RSpec.describe Course, type: :model do
  it { should belong_to(:school) }
  it { should have_many(:course_terms) }
  it { should have_many(:terms).through(:course_terms) }
end
