require 'open-uri'

class LuckyNumsController < ApplicationController
  before_action :parse_and_validate, only: :view

  def input; end

  def view
    url = make_response_url(@num)
    if @side == 'server'
      @table = nokogiri_tranform(url)
    elsif @side == 'client'
      @table = insert_xslt(url).to_xml
    end
  end

  private

  BASE_URL = 'http://127.0.0.1:3000/'
  XSLT_SERVER = "#{Rails.root}/public/transform.xslt"
  XSLT_BROWSER = "/transform.xslt"

  def parse_and_validate
    @num = params[:num]
    @side = params[:side]
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
    xslt = Nokogiri::XML::ProcessingInstruction.new(doc, 'xml-stylesheet', 'type="text/xsl" href="' + XSLT_BROWSER + '"')
    doc.root.add_previous_sibling(xslt)
    doc
  end
end
