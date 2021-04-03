# spec/controllers/feed_posts_controller_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FeedPostsController, type: :controller do
  let(:user1) { create :account }
  let(:user2) { create :account }
  let(:params) { { account_id: user2 } }

  let!(:follow) { create :follow, follower: user1, following: user2 }

  before { sign_in user1 }

  describe 'index' do
    subject { get :index, params: params }

    let!(:post) { create :post, account: user2 }

    it 'assigns @posts' do
      subject
      expect(assigns(:posts)).to eq([post])
    end

    it { is_expected.to render_template('index') }
  end
end
