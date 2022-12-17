class AddIndexToLogin < ActiveRecord::Migration[7.0]
  def change
    add_index :users, :login, unique: true
  end
end
