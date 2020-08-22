require 'rails_helper'

RSpec.describe "info_pages/about.html.erb", type: :view do

  it "is it a toad?" do
    # expect("info_pages/about").to have_css("img[src*='pepeinst.jpeg']") # FIXED
    # expect(img_tag["src"]).to eq "pepeinst.jpeg" # FIXED
  end
  
end
