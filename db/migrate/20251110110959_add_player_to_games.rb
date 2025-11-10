class AddPlayerToGames < ActiveRecord::Migration[8.0]
  def change
    add_reference :games, :player, null: false, foreign_key: true
  end
end
