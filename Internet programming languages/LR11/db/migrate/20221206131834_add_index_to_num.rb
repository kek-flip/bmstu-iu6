class AddIndexToNum < ActiveRecord::Migration[7.0]
  def change
    add_index :lucky_nums, :num
  end
end
