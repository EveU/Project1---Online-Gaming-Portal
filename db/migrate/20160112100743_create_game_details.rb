class CreateGameDetails < ActiveRecord::Migration
  def change
    create_table :game_details do |t|
      t.string :name
      t.text :image
      t.text :description

      t.timestamps null: false
    end
  end
end
