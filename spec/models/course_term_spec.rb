require 'rails_helper'

RSpec.describe CourseTerm, type: :model do
  it { should belong_to(:course) }
  it { should belong_to(:term) }
end
