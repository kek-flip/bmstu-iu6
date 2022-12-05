# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'LuckyNums', type: :request do
  describe 'GET /input' do
    it 'returns http success' do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /view' do
    it 'returns http success' do
      get lucky_nums_path
      expect(response).to have_http_status(:success)
    end
    it 'returns http 302 with wrong params' do
      get lucky_nums_path, params: { num: -12 }
      expect(response).to have_http_status(302)
    end
  end
end
