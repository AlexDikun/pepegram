# spec/controllers/likes_controller_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  let(:account) { create :account }
  let(:post) { create :post, account: account }

  describe 'index' do
    let!(:like) {create :like, account: account, post: post }
    let(:params) { { post_id: post } }

    subject { get :index, params: params }

    it 'assigns @likes' do
      subject
      expect(assigns(:likes)).to eq([like])
    end

    it { is_expected.to render_template('index') }
  end

  describe 'create' do
    let(:params) { { post_id: post, account_id: account } }

    subject { process :create, method: :post, params: params }

    context 'when account sign in' do
      before { sign_in account }

      it 'create like' do
        expect { subject }.to change { Like.count }.by(1)
        is_expected.to redirect_to(account_post_path(post.account, assigns(:post)))
      end
    end
  end

  describe 'destroy' do
    let!(:like) {create :like, account: account, post: post }
    let(:params) { { post_id: post, id: like } }

    subject { delete :destroy, params: params }

    it 'unlike' do
      expect { subject }.to change { Like.count }.by(-1)
      is_expected.to redirect_to(account_post_path(post.account, assigns(:post)))
    end
  end
end
