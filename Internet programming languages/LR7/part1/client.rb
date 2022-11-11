# frozen_string_literal: true

require_relative 'main'

if create_rand_file
  puts 'File F.txt was successfully created!'
  if transfer_data
    puts 'File H.txt was successfully created!'
  else
    puts 'Cannot create file H.txt'
  end
else
  puts 'Cannot create file F.txt'
end
