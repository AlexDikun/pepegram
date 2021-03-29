# spec/features/follow_features_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Follow features', :js, type: :feature do
  let(:first_account) { create :account }
  let(:second_account) { create :account }

  scenario 'user is testing follow functionality' do
    login_as first_account
    visit account_path(id: second_account)
    visit account_followers_path(account_id: second_account)
    expect(page).not_to have_content(first_account.username.to_s)

    click_link 'Back'
    click_link 'Follow'
    visit account_followers_path(account_id: second_account)
    expect(page).to have_content(first_account.username.to_s)

    click_link 'Back'
    click_link 'Unfollow'
    visit account_followers_path(account_id: second_account)
    expect(page).not_to have_content(first_account.username.to_s)
  end
end
