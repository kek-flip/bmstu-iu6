# frozen_string_literal: true

class LuckyNum < ApplicationRecord
  validates :num, presence: { message: 'не может быть пустым' }
  validates :num, format: { with: /\A\s{0,}[1-9][0-9]{0,}\s{0,}\z/ , message: 'должно быть целым положительным числом' }
  validates :num, uniqueness: { message: 'такая запись уже существует' }
  
  validates :lucky_nums, presence: { message: 'не может быть пустым' }
  validates :lucky_nums, format: { with: /\A(\d+,\d+\s){0,}\z/, message: 'должны иметь другой формат' }
end
