require 'rails_helper'

RSpec.describe "ServiceReviews", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/service_reviews/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /delete" do
    it "returns http success" do
      get "/service_reviews/delete"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/service_reviews/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
