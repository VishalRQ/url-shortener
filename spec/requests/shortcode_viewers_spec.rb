require 'rails_helper'

RSpec.describe "ShortcodeViewers", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/shortcode_viewers/index"
      expect(response).to have_http_status(:success)
    end
  end

end
