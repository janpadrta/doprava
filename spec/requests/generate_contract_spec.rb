require 'rails_helper'

RSpec.describe "GenerateContracts", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/generate_contract/show"
      expect(response).to have_http_status(:success)
    end
  end

end
