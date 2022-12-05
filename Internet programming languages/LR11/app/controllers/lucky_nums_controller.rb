# frozen_string_literal: true

# LuckyNumsController
class LuckyNumsController < ApplicationController
  def input; end

  def view
    if LuckyNum.find_by(num: params[:num].to_i).nil?
      n = params[:num].to_i
      @lucky_num = LuckyNum.new(num: n, lucky_nums: helpers.find_lucky_nums(n))
      redirect_to(root_path, alert: @lucky_num.errors.first.full_message) if @lucky_num.invalid?
      @lucky_num.save
    else
      @lucky_num = LuckyNum.find_by(num: params[:num].to_i)
    end
  end
end
