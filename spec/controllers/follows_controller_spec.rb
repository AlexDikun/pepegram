# spec/controllers/follows_controller_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FollowsController, type: :controller do
  let!(:first_user)  { create :account }
  let!(:second_user) { create :account }

  # current_account
  before { sign_in first_user }

  describe 'create' do
    let(:params) { { following_id: second_user.id } }

    subject { post :create, params: params }

    it 'create follow' do
      expect { subject }.to change { Follow.count }.by(1)
      # is_expected.to redirect_to(account_posts_path(assigns(:second_user))) # what do not work?
      is_expected.to redirect_to(account_posts_path(second_user))
    end
  end

  describe 'destroy' do
    let!(:follow) { Follow.create(follower: first_user, following: second_user) }
    let(:params) { { following_id: second_user.id, id: follow.id } }

    subject { delete :destroy, params: params }

    it 'destroy follow' do
      expect { subject }.to change { Follow.count }.by(-1)
      is_expected.to redirect_to(account_path(first_user))
    end
  end
end
