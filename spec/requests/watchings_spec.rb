require 'rails_helper'

RSpec.describe "Watchings", type: :request do
  describe "GET /watchings" do
    it "works! (now write some real specs)" do
      get watchings_path
      expect(response).to have_http_status(200)
    end
  end
end
