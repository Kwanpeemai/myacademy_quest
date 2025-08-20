require 'rails_helper'

RSpec.describe "Brags", type: :request do
  describe "GET /brag" do
    it "Should display 'PEEMAI 2025' on the index page" do
      get brag_path
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("PEEMAI 2025")
    end
  end
end
