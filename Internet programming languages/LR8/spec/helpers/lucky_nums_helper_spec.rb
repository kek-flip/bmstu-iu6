require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the LuckyNumsHelper. For example:
#
# describe LuckyNumsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe LuckyNumsHelper, type: :helper do
  describe "calc_sum" do
    it "calc num of zeros" do
      num = '0000'
      expect(calc_sum(num, 0, 4)).to eq(0)
    end
    it "calc sum of special digits in num" do
      num = '12345'
      expect(calc_sum(num, 0, 2)).to eq(3)
    end
  end
end
