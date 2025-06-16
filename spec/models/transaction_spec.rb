require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it { should belong_to(:license).optional }
  it { should have_many(:registrations) }
end
