# spec/controllers/comments_controller_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let!(:first_user) { create :account }
  let!(:post) { create :post, account: first_user }
  let!(:params) { { post_id: post } }

  describe 'new' do
    subject { get :new, params: params } # params: post_id

    context 'when account sign in' do
      before { sign_in first_user }

      it { is_expected.to render_template(:new) }

      it 'assigns new comment' do
        subject
        expect(assigns(:comment)).to be_a_new Comment
      end
    end
  end
end
