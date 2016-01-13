class CreateGameCounters < ActiveRecord::Migration
  def change
    create_table :game_counters do |t|
      t.string :game_counter
      t.string :game_counter_image

      t.timestamps null: false
    end
  end
end
