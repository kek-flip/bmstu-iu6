require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_uniqueness_of(:login).with_message('Имя пользователя уже существует') }
  it { should validate_presence_of(:login).with_message('Имя пользователя не должно быть пустым') }
end
