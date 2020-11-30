require 'rails_helper'

RSpec.describe "FeedPosts", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/feed_posts/index"
      expect(response).to have_http_status(:success)
    end
  end

end
