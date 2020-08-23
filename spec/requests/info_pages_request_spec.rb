require 'rails_helper'

RSpec.describe "InfoPages", type: :request do

  describe "GET /about" do
    it "returns http success" do
      get "/info_pages/about"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /home" do
    it "returns http success" do
      get "/info_pages/home"
      expect(response).to have_http_status(:success)
    end
  end

end
