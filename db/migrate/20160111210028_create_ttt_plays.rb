class CreateTttPlays < ActiveRecord::Migration
  def change
    create_table :ttt_plays do |t|
      t.integer :p1
      t.integer :p2
      t.integer :turn
      t.string :board
      t.string :result
      t.string :winner
      t.timestamps null: false
    end
  end
end
