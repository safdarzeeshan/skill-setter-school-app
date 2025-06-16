require 'rails_helper'

RSpec.describe License, type: :model do
  it { should belong_to(:term) }
  it { should belong_to(:redeemed_by_student).class_name('Student').optional }
  it { should have_one(:transaction) }
end
