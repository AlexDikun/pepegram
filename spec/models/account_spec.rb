require 'rails_helper'

RSpec.describe Account, type: :model do

  subject { build(:account) }

  it { is_expected.to have_many(:posts) }
  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
  it { is_expected.to have_many(:posts) }

end
