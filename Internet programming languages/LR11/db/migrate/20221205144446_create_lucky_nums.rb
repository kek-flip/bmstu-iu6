class CreateLuckyNums < ActiveRecord::Migration[7.0]
  def change
    create_table :lucky_nums do |t|
      t.string :num
      t.string :lucky_nums

      t.timestamps
    end
  end
end
