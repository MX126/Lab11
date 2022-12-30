require 'rails_helper'

RSpec.describe "DbWorkers", type: :request do
  describe "GET /input" do
    it "returns http success" do
      get "/db_worker/input"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /result" do
    it "returns http success" do
      get "/db_worker/result"
      expect(response).to have_http_status(:success)
    end
  end

end
