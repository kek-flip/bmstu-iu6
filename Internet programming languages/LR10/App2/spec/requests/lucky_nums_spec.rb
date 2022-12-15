require 'rails_helper'

RSpec.describe "LuckyNums", type: :request do
  describe "GET /input" do
    it "returns http success" do
      get "/lucky_nums/input"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /view" do
    it "returns http success" do
      get "/lucky_nums/view"
      expect(response).to have_http_status(:success)
    end
  end

end
