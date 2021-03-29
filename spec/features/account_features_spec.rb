# spec/features/account_features_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Like features', :js, type: :feature do
  let(:first_account) { create :account }
  let(:second_account) { create :account }

  scenario 'user is testing account functionality' do
    login_as first_account

    visit account_path(id: first_account)
    click_link 'Update profile'

    fill_in 'Username', with: 'Alex Dikun'
    fill_in 'Bio', with: 'Hi! I am a old student Sevastopol University'
    attach_file(Rails.root.join('app/assets/images/pepeinst.jpeg'))

    click_button 'Update Account'

    expect(page).to have_content('Alex Dikun')

    visit account_path(id: second_account)
    expect(page).not_to have_link('Update profile')
  end
end
