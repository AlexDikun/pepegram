# spec/features/comment_features_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Comment features', :js, type: :feature do
  let(:first_account) { create :account }
  let(:second_account) { create :account }
  let(:post) { create :post, account: first_account }

  before do
    post.image_derivatives!
    post.save
  end

  scenario 'user is testing comment functionality' do
    login_as first_account
    visit account_post_path(account_id: first_account, id: post)
    expect(page).not_to have_link('delete')

    click_link 'add comment'
    fill_in 'Message', with: 'first fuck!'
    click_button 'Create Comment'
    expect(page).to have_content('first fuck!')
    expect(page).to have_link('delete')

    login_as second_account
    visit account_post_path(account_id: first_account, id: post)
    expect(page).not_to have_link('delete')

    login_as first_account
    visit account_post_path(account_id: first_account, id: post)
    click_link 'delete'
    expect(page).not_to have_content('first fuck!')
  end
end
