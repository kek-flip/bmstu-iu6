# frozen_string_literal: true

require 'faker'

def create_rand_file
  File.open('F.txt', 'w') do |file|
    rand(100..1000).times do
      file.write(Faker::Alphanumeric.alpha(number: rand(1..10)) + (rand(1..10).even? ? ' ' : "\n"))
    end
  end

  File.exist? 'F.txt'
end

def write_data_to_file(file_to_write)
  File.open('F.txt', 'r') do |file|
    while line = file.gets
      line.split(' ').each { |word| file_to_write.puts word if word.include?('a') }
    end
  end.nil?
end

def create_file_to_write
  File.open('H.txt', 'w')
end

def transfer_data
  file_to_write = create_file_to_write
  return false if file_to_write.nil?

  write_data_to_file(file_to_write)
end
