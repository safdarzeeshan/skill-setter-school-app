require 'rails_helper'

RSpec.describe Registration, type: :model do
  it { should belong_to(:student) }
  it { should belong_to(:transaction).optional }
  it { should belong_to(:registrationable) }
end
