# frozen_string_literal: true

def correct_string(str)
  str.split(' ').select { |w| (w =~ /[AaEeIiOoUuYy]/).nil? == false }.join(' ')
end

def wrong_words_num(str)
  str.split(' ').select { |w| (w =~ /[AaEeIiOoUuYy]/).nil? }.length
end
