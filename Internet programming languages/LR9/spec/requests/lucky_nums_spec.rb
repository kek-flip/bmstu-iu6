# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'LuckyNums', type: :request do
  describe 'GET /' do
    before { get root_path }
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'renders input template' do
      expect(response).to render_template(:input)
    end
    it 'responds with html' do
      expect(response.content_type).to match(%r{text/html})
    end
  end

  describe 'POST /lucky_nums' do
    context 'when params are right' do
      before {  post lucky_nums_path, params: { num: Faker::Number.number(digits: 4) }, xhr: true }
      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end
      it 'renders result templates' do
        expect(response).to render_template(:view)
        expect(response).to render_template(:_output_table)
      end
      it 'responds with turbo stream' do
        expect(response.content_type).to match(%r{text/vnd.turbo-stream.html})
      end
    end

    context 'when params are wrongs' do
      it 'returns 302 http when params are empty' do
        post lucky_nums_path, params: { num: '' }, xhr: true
        expect(response).to have_http_status(302)
      end
      it 'returns 302 http when num <= 0' do
        post lucky_nums_path, params: { num: Faker::Number.within(range: -9999..0) }, xhr: true
        expect(response).to have_http_status(302)
      end
      it 'responds with html' do
        post lucky_nums_path, params: { num: '' }, xhr: true
        expect(response.content_type).to match(%r{text/html})
      end
    end
  end
end
