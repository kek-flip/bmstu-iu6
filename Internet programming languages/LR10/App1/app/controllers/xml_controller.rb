# frozen_string_literal: true

# XML controller
class XmlController < ApplicationController
  before_action :parse_and_validate, only: :index

  def index
    @data = if @error.nil?
              helpers.find_lucky_nums(@num.to_i).map { |key, value| { num: key, sum: value } }
            else
              @error
            end

    respond_to do |format|
      format.xml { render xml: @data.to_xml }
      format.rss { render xml: @data.to_xml }
    end
  end

  private

  def parse_and_validate
    @num = params[:num]
    @error = { message: 'Параметр num не может отсутствовать' } if @num.nil?
    @error = { message: 'Переданное число должно быть целым и положительным' } if @num !~ /\A[1-9][0-9]{0,}\z/
  end
end
