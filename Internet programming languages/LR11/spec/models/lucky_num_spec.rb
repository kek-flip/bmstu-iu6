# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LuckyNum, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:num).with_message('должно быть целым положительным числом') }
    it { should validate_presence_of(:num).with_message('не может быть пустым') }
    it { should validate_uniqueness_of(:num).with_message('такая запись уже существует') }
  end
end
