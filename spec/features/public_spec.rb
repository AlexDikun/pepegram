require "rails_helper"

RSpec.feature "public", :type => :feature do

  context "testing the action Home" do

    it "Is it a toad?" do
      visit 'public/about'
      expect(page).to have_css("img[src*='/assets/pepeinst-324e381c4d28e2dbb" \
                      "3e95edc0afd86a8b8405f9dfd8751bb3d4e111afdbcc41a.jpg']")
    end

  end
end
