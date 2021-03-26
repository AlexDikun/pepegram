# spec/controllers/accounts_controller_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AccountsController, type: :controller do
  let(:user) { create :account }
  let(:params) { { id: user.id } }

  describe 'show' do
    subject { get :show, params: params }

    it 'assigns @acc' do
      subject
      expect(assigns(:acc)).to eq(user)
    end

    it { is_expected.to render_template(:show) }
  end

  describe 'edit' do
    before { sign_in user }

    subject { process :edit, method: :get, params: params }

    it { is_expected.to render_template(:edit) }

    it 'assigns server policy' do
      subject
      expect(assigns(:acc)).to eq(user)
    end
  end

  describe 'update' do
    let!(:user) { create :account }
    let(:params) { { id: user.id, account: { username: 'Navalny' } } }

    before { sign_in user }

    subject { process :update, method: :put, params: params }

    it { is_expected.to redirect_to(account_path(assigns(:acc))) }

    it 'updates account' do
      expect { subject }.to change { user.reload.username }.to('Navalny')
    end

    context 'with bad params' do
      let(:params) { { id: user.id, account: { username: ' ' } } }

      it { is_expected.to render_template(:edit) }

      it 'does not update account' do
        expect { subject }.not_to change { user.reload.username }
      end
    end
  end
end
