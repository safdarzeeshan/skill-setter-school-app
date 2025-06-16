require 'rails_helper'

RSpec.describe SchoolAdmin, type: :model do
  it { should belong_to(:school) }
end
