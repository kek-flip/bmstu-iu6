# frozen_string_literal: true

# LuckyNumsController
class LuckyNumsController < ApplicationController
  def input; end

  def view
    n = params[:num]
    if LuckyNum.find_by(num: n).nil?
      @lucky_num = LuckyNum.new(num: n, lucky_nums: helpers.find_lucky_nums(n.to_i))
      redirect_to(root_path, alert: @lucky_num.errors.first.full_message) unless @lucky_num.save
    else
      @lucky_num = LuckyNum.find_by(num: n)
    end
  end
end
