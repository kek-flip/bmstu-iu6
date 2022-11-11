# frozen_string_literal: true

require_relative 'main'

RSpec.describe 'create_rand_file()' do
  it 'Create non-empty file' do
    create_rand_file
    file = File.open('F.txt', 'r')
    expect(file.gets).not_to be nil
  end
end

RSpec.describe 'write_data_to_file()' do
  it 'Create file to write' do
    create_file_to_write
    expect(File.exist?('H.txt')).to be true
  end
  it "New file contains words only with 'a'" do
    create_rand_file
    transfer_data
    words = File.readlines 'H.txt'
    expect(words).to all(match(/a/))
  end
  it 'All words from H.txt are in F.txt' do
    create_rand_file
    transfer_data
    words_H = File.readlines('H.txt').each(&:chomp!)
    words_F = []
    File.readlines('F.txt').each do |line|
      line.chomp!
      words_F.concat(line.split(' '))
    end
    expect((words_H - words_F)).to be_empty
  end
end
