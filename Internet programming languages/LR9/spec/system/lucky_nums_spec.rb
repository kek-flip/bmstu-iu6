# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Static content', type: :system do
  let(:num_value) { Faker::Number.number(digits: 4) }
  scenario 'Enter num' do
    visit root_path
    fill_in :num, with: num_value
    find('#result-btn').click
    expect(find('#output')).to match(/Счастливые числа до #{num_value}\.+/)
  end
end
