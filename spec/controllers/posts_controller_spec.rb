# spec/controllers/posts_controller_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:account) { create :account }
  let(:params) { { account_id: account } }

  before { sign_in account }

  describe 'index' do
    subject { get :index, params: params }

    let!(:post) { create :post, account: account }

    it 'assigns @posts' do
      subject
      expect(assigns(:posts)).to eq([post])
    end

    it { is_expected.to render_template('index') }
  end

  describe 'show' do
    let(:params) { { account_id: account.id, id: post } }
    subject { get :show, params: params }

    let!(:post) { create :post, account: account }

    it 'assigns @post' do
      subject
      expect(assigns(:post)).to eq(post)
    end

    it { is_expected.to render_template(:show) }

    context 'when account tries to see someone elses post' do
      let!(:post) { create :post }
      it { expect { subject }.to raise_error(ActiveRecord::RecordNotFound) }
    end
  end

  describe 'new' do
    subject { get :new, params: params }

    context 'when account sign in' do
      before { sign_in account }

      it { is_expected.to render_template(:new) }

      it 'assigns new post' do
        subject
        expect(assigns(:post)).to be_a_new Post
      end
    end
  end

  describe 'create' do
    let!(:params) do
      {
        account_id: account.id,
        post: attributes_for(:post)
      }
    end

    subject { process :create, method: :post, params: params }

    it 'create post' do
      expect { subject }.to change { Post.count }.by(1)
      is_expected.to redirect_to(account_post_path(assigns(:acc), assigns(:post)))
    end

    context 'when params invalid' do
      let!(:params) do
        {
          account_id: account.id,
          post: { message: nil }
        }
      end

      it { is_expected.to render_template(:new) }
      it { expect { subject }.not_to change { Post.count } }
    end
  end

  describe 'destroy' do
    let!(:account) { create :account }
    before { sign_in account }
    let!(:post) { create :post, account: account }
    let(:params) { { account_id: account.id, id: post.id } }

    subject { delete :destroy, params: params }

    it 'destroy post' do
      expect { subject }.to change { Post.count }.by(-1)
      is_expected.to redirect_to(account_posts_path(assigns(:acc)))
    end
  end
end
