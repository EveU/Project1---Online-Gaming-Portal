class AddOpponentIdToPlays < ActiveRecord::Migration
  def change
    add_column :plays, :opponent_id, :integer
  end
end
