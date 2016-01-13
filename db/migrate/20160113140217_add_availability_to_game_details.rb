class AddAvailabilityToGameDetails < ActiveRecord::Migration
  def change
    add_column :game_details, :availability, :string
  end
end
