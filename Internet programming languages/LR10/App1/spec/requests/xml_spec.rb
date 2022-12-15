require 'rails_helper'

RSpec.describe "Xmls", type: :request do
  describe "GET /" do
    context "Request format is RSS" do
      before { get root_path, params: { num: Faker::Number.number(digits: 4), format: :rss } }
      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end
      it 'responds with rss' do
        expect(response.content_type).to match(%r{application/rss})
      end
    end

    context "Request format is XML" do
      before { get root_path, params: { num: Faker::Number.number(digits: 4), format: :xml } }
      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end
      it 'responds with rss' do
        expect(response.content_type).to match(%r{application/xml})
      end
    end
  end
end
