require 'rails_helper'

RSpec.describe School, type: :model do
  it { should have_many(:students) }
  it { should have_many(:school_admins) }
  it { should have_many(:terms) }
  it { should have_many(:courses) }
end
