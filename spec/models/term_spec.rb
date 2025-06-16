require 'rails_helper'

RSpec.describe Term, type: :model do
  it { should belong_to(:school) }
  it { should have_many(:course_terms) }
  it { should have_many(:courses).through(:course_terms) }
  it { should have_many(:licenses) }
end
