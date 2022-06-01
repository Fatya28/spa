require 'rails_helper'

RSpec.describe "Masters", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/masters/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/masters/show"
      expect(response).to have_http_status(:success)
    end
  end

end
