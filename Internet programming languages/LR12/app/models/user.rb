class User < ApplicationRecord
  has_secure_password
  validates_uniqueness_of :login, message: 'Имя пользователя уже существует'
  validates_presence_of :login, message: 'Имя пользователя не должно быть пустым'
  validates_presence_of :password, message: 'Пароль пользователя не должно быть пустым'
  validates_confirmation_of :password
end
