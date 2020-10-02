# spec/controllers/followings_controller_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FollowingsController, type: :controller do
  let(:user1)  { create :account }
  let(:params) { { account_id: user1 } }
  before { sign_in user1 }

  let(:user2)  { create :account }
  let!(:follow) { Follow.create(follower: user1, following: user2) }

  describe 'index' do
    subject { get :index, params: params }

    let(:following) { user1.followings }

    it 'assigns @followers' do
      subject
      expect(assigns(:followings)).to eq(following)
    end

    it { is_expected.to render_template('index') }
  end
end
