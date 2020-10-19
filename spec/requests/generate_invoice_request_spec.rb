require 'rails_helper'

RSpec.describe "GenerateInvoices", type: :request do

  describe "GET /show" do
    it "returns http success" do
      get "/generate_invoice/show"
      expect(response).to have_http_status(:success)
    end
  end

end
