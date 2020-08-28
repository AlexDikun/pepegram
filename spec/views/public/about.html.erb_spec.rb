require 'rails_helper'

RSpec.describe "public/about.html.erb", type: :view do

  # this test is broken
  it "Is it a toad?" do
    expect(page).to have_css("img[src*='pepeinst.jpeg']")
end
