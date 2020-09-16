require 'rails_helper'

RSpec.describe Account, type: :model do
  subject { build(:account) }

  it { is_expected.to have_many(:posts) }
  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
  it { is_expected.to validate_presence_of(:password) }

  it { is_expected.to have_many(:follower_follows).with_foreign_key(:following_id.class_name('Follow') }
  it { is_expected.to have_many(:followers).through(:follower_follows).source(:follower) }

  it { is_expected.to have_many(:following_follows).with_foreign_key(:follower_id).class_name('Follow') }
  it { is_expected.to have_many(:followings).through(:followings_follows).source(:following) }

end
