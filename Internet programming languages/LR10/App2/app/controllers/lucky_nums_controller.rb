# frozen_string_literal: true

require 'open-uri'

# LuckyNum controller
class LuckyNumsController < ApplicationController
  before_action :parse_and_validate, only: :view

  def input; end

  def view
    url = make_response_url(@num)
    case @side
    when 'server'
      @table = nokogiri_tranform(url)
    when 'client'
      render xml: insert_xslt(url)
    else
      redirect_to(root_path, alert: 'Неизвестное место обработки запроса')
    end
  end

  private

  BASE_URL = 'http://127.0.0.1:3000/'
  XSLT_SERVER = "#{Rails.root}/public/transform.xslt".freeze
  XSLT_BROWSER = '/transform.xslt'

  def parse_and_validate
    @num = params[:num]
    @side = params[:side]
    redirect_to(root_path, alert: 'Переданное число должно быть целым и положительным') if @num !~ /\A[1-9][0-9]{0,}\z/
  end

  def make_response_url(num)
    BASE_URL + "?num=#{num}&format=xml"
  end

  def nokogiri_tranform(url)
    doc = Nokogiri::XML(URI.open(url))
    xslt = Nokogiri::XSLT(File.read(XSLT_SERVER))
    xslt.transform(doc)
  end

  def insert_xslt(url)
    doc = Nokogiri::XML(URI.open(url))
    xslt = Nokogiri::XML::ProcessingInstruction.new(doc, 'xml-stylesheet',
                                                    "type=\"text/xsl\" href=\"#{XSLT_BROWSER}\"")
    doc.root.add_previous_sibling(xslt)
    doc
  end
end
