class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.integer :play_id
      t.string :symbol
      t.integer :board_index

      t.timestamps null: false
    end
  end
end
