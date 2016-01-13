class AddWinnerIdToPlays < ActiveRecord::Migration
  def change
    add_column :plays, :winner_id, :integer
  end
end
