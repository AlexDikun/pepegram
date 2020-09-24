# spec/controllers/follows_controller.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FollowsController, type: :controller do
  let!(:first_user)  { create :account }
  let!(:second_user) { create :account }

  before { sign_in first_user }
  before { sign_in second_user }

  describe 'create' do
    let(:params) do
      {
        follower_id:  first_user.id,
        following_id: second_user.id,
      }
    end

    subject { post :create, params: params }

    it 'create follow' do
      expect { subject }.to change { Follow.count }.by(1)
      # is_expected.to redirect_to(account_posts_path(assigns(:second_user))) # what do not work?
      is_expected.to redirect_to(account_posts_path(second_user))
    end
  end
end
