require 'rails_helper'

RSpec.describe LuckyNum, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:num).with_message('должно быть больше нуля') }
    it { should validate_presence_of(:num).with_message('не может быть пустым') }
  end
end
