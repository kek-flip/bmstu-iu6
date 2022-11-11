# frozen_string_literal: true

require_relative 'main'

RSpec.describe House do
  it 'Has child SmartHouse' do
    expect(House >= SmartHouse).to be true
  end
end

RSpec.describe SmartHouse do
  it 'Has parent House' do
    expect(SmartHouse < House).to be true
  end
end
