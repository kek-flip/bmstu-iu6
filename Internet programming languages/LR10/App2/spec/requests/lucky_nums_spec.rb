require 'rails_helper'

RSpec.describe "LuckyNums", type: :request do
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

  describe 'GET /lucky_nums' do
    context "when server side has chosen" do
      context "when params are right" do
        before { get lucky_nums_path, params: { num: Faker::Number.number(digits: 4), side: 'server' } }
        it 'returns http success' do
          expect(response).to have_http_status(:success)
        end
        it 'renders result templates' do
          expect(response).to render_template(:view)
        end
        it 'responds with html' do
          expect(response.content_type).to match(%r{text/html})
        end
      end

      context "when params are wrong" do
        it 'returns 302 http when params are empty' do
          get lucky_nums_path, params: { num: nil, side: 'server'}
          expect(response).to have_http_status(302)
        end
        it 'returns 302 http when num <= 0' do
          get lucky_nums_path, params: { num: Faker::Number.within(range: -9999..0), side: 'server' }
          expect(response).to have_http_status(302)
        end
        it 'responds with html' do
          get lucky_nums_path, params: { num: '', side: 'server' }
          expect(response.content_type).to match(%r{text/html})
        end
      end
    end

    context "when browser side has chosen" do
      context "when params are right" do
        before { get lucky_nums_path, params: { num: Faker::Number.number(digits: 4), side: 'client' } }
        it 'returns http success' do
          expect(response).to have_http_status(:success)
        end
        it 'responds with xml' do
          expect(response.content_type).to match(%r{application/xml})
        end
      end

      context "when params are wrong" do
        it 'returns 302 http when params are empty' do
          get lucky_nums_path, params: { num: nil, side: 'client'}
          expect(response).to have_http_status(302)
        end
        it 'returns 302 http when num <= 0' do
          get lucky_nums_path, params: { num: Faker::Number.within(range: -9999..0), side: 'client' }
          expect(response).to have_http_status(302)
        end
        it 'responds with html' do
          get lucky_nums_path, params: { num: '', side: 'client' }
          expect(response.content_type).to match(%r{text/html})
        end
      end
    end

    it 'returns 302 http when side is unknow' do
      get lucky_nums_path, params: { num: Faker::Number.number(digits: 4), side: 'aaaa' }
      expect(response).to have_http_status(302)
    end
    it 'returns 302 http when side is empty' do
      get lucky_nums_path, params: { num: Faker::Number.number(digits: 4), side: '' }
      expect(response).to have_http_status(302)
    end
  end
end
