# spec/features/posts_page_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts page', :js, type: :feature do
  let(:account) { create :account }

  scenario 'user is testing post functionality' do
    login_as account

    visit new_account_post_path(account_id: account)

    fill_in 'Title', with: 'Shrek'
    fill_in 'Message', with: 'Shrek is life?'
    attach_file(Rails.root.join('app/assets/images/pepeinst.jpeg'))

    click_button 'Create Post'

    expect(page).to have_content('Shrek is life?')

    click_link 'Edit'
    fill_in 'Message', with: 'Shrek is love!'
    click_button 'Update Post'

    expect(page).to have_content('Shrek is love!')

    click_link 'Destroy'
    accept_confirm 'You are sure?'

    expect(page).to have_content("Your posts, #{account.username}")
  end
end
