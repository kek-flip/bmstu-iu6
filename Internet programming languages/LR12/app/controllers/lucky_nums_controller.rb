# frozen_string_literal: true

# LuckyNumsController
class LuckyNumsController < ApplicationController
  before_action :parse_and_validate, only: :view

  def input; end

  def view
    flash.clear
    @lucky_nums = {}
    0.upto(@num.to_i) do |i|
      i_str = i.to_s
      i_str.insert(0, '0' * (6 - i_str.length))
      l_sum = helpers.calc_sum(i_str, 0, 3)
      r_sum = helpers.calc_sum(i_str, 3, 6)
      @lucky_nums[i] = l_sum if l_sum == r_sum
    end
  end

  private

  def parse_and_validate
    @num = params[:num]
    return unless @num !~ /\A[1-9][0-9]{0,}\z/

    redirect_to(lucky_nums_input_path,
                alert: 'Переданное число должно быть целым и положительным')
  end
end
