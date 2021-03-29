# spec/features/like_features_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Like features', :js, type: :feature do
  let(:account) { create :account }
  let(:post) { create :post, account: account }

  before do
    post.image_derivatives!
    post.save
  end

  scenario 'user is testing like functionality' do
    login_as account
    visit account_post_path(account_id: account, id: post)
    expect(page).to have_link('Like')
    click_link 'Liked: 0'
    expect(page).not_to have_content("#{account.username}")

    click_link 'Back'
    click_link 'Like'
    expect(page).to have_link('Unlike')
    click_link 'Liked: 1'
    expect(page).to have_content("#{account.username}")

    click_link 'Back'
    click_link 'Unlike'
    expect(page).to have_link('Like')
    click_link 'Liked: 0'
    expect(page).not_to have_content("#{account.username}")
  end
end
