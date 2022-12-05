# frozen_string_literal: true

# Lucky Nums Controller
class LuckyNumsController < ApplicationController
  before_action :validate_num, only: :view

  def input; end

  def view
    @n = params[:num].to_i
    @lucky_nums = {}
    0.upto(@n) do |i|
      i_str = i.to_s
      i_str.insert(0, '0' * (6 - i_str.length))
      @lucky_nums[i] = helpers.calc_sum(i_str, 0, 3) if helpers.calc_sum(i_str, 0, 3) == helpers.calc_sum(i_str, 3, 6)
    end
  end

  private

  def validate_num
    redirect_to(root_path, alert: 'Ошибка! Число должно быть > 0') if params[:num].to_i.negative?
  end
end
