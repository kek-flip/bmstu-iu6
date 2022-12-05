# frozen_string_literal: true

class LuckyNum < ApplicationRecord
  validates :num, presence: { message: 'не может быть пустым' }
  validates :num, comparison: { greater_than: 0, message: 'должно быть больше нуля' }
end
