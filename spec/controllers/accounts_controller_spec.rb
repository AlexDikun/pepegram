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
end
