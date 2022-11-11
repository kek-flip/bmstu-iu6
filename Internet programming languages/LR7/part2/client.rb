# frozen_string_literal: true

require_relative 'main'

h = House.new(1990, 4000, 6_000_000)
h.print_info
puts '==========================='
sh = SmartHouse.new(1996, 50, 300)
sh.print_info
