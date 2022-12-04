class LuckyNumsResult
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :num

  validates :num, presence: { message: 'не может быть пустым' }
  validates :num, format: { with: /[1-9][0-9]{0,}/, message: 'Должно быть целым числом больше нуля'}

  def result
    lucky_nums = {}
    0.upto(num.to_i) do |i|
      i_str = i.to_s
      i_str.insert(0, '0' * (6 - i_str.length))
      lucky_nums[i] = helpers.calc_sum(i_str, 0, 3) if helpers.calc_sum(i_str, 0, 3) == helpers.calc_sum(i_str, 3, 6)
    end
    lucky_nums
  end
end