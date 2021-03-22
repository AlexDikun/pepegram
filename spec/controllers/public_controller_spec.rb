# spec/controllers/public_controller_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PublicController, type: :controller do
  let(:account) { create :account }

  describe 'people' do
    subject { get :people }

    it 'assigns @accounts' do
      subject
      expect(assigns(:accounts)).to eq([account])
    end

    it { is_expected.to render_template('people') }
  end
end
