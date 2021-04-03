# spec/features/feed_features_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Feed features', :js, type: :feature do
  let(:first_account) { create :account }
  let(:second_account) { create :account }

  let(:post) { create :post, account: second_account }

  scenario 'user is testing feed news functionality' do
    login_as first_account

    visit account_path(id: first_account)
    click_link 'Feed'
    expect(page).not_to have_content(post.title.to_s)

    visit account_path(id: second_account)
    click_link 'Follow'

    visit account_path(id: first_account)
    click_link 'Feed'
    expect(page).to have_content(post.title.to_s)
  end
end
