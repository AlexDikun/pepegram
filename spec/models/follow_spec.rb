# spec/models/follow_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Follow, type: :model do
  it { is_expected.to belong_to :follower }
  it { is_expected.to belong_to :following }

  let(:follower) { FactoryBot.create(:account) }
  let(:following) { FactoryBot.create(:account) }
  let(:follow) { Follow.create(follower: follower, following: following) }

  subject { follow }

  it { should be_valid }

  context 'when follower id is not present' do
    before { follow.follower_id = nil }
    it { should_not be_valid }
  end

  context 'when following id is not present' do
    before { follow.following_id = nil }
    it { should_not be_valid }
  end
end
