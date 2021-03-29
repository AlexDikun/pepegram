# spec/controllers/comments_controller_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:first_user) { create :account }
  let(:post) { create :post, account: first_user }

  describe 'new' do
    let(:params) { { post_id: post } }

    subject { get :new, params: params }

    context 'when account sign in' do
      before { sign_in first_user }

      it { is_expected.to render_template(:new) }

      it 'assigns new comment' do
        subject
        expect(assigns(:comment)).to be_a_new Comment
      end
    end
  end

  before { sign_in first_user }

  describe 'create' do
    let!(:params) do
      {
        post_id: post.id,
        comment: attributes_for(:comment)
      }
    end

    # subject { post :create, params: params } # do not work. why?
    subject { process :create, method: :post, params: params }

    it 'create comment' do
      expect { subject }.to change { Comment.count }.by(1)
      is_expected.to redirect_to(account_post_path(post.account, assigns(:post)))
    end

    context 'when params invalid' do
      let!(:params) do
        {
          post_id: post.id,
          comment: { message: nil }
        }
      end

      it { is_expected.to render_template(:new) }
      it { expect { subject }.not_to(change { Comment.count }) }
    end
  end

  describe 'destroy' do
    let!(:comment) { create :comment, account: first_user, post: post }
    let(:params) { { post_id: post.id, id: comment.id } }

    subject { delete :destroy, params: params }

    it 'destroy comment' do
      expect { subject }.to change { Comment.count }.by(-1)
      is_expected.to redirect_to(account_post_path(post.account, assigns(:post)))
    end
  end
end
