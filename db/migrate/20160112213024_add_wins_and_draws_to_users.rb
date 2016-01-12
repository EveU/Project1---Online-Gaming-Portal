class AddWinsAndDrawsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :wins, :integer
    add_column :users, :draws, :integer
  end
end
