User.delete_all
GameDetail.delete_all
Play.delete_all

User.create!(username: 'Arthur', email: 'arthur@admin.example', password: 'password')
User.create!(username: 'Betty', email: 'betty@user.example', password: 'password')
User.create!(username: 'Charles', email: 'charles@user.example', password: 'password')

GameDetail.create!(name: "Tic Tac Toe", image: "http://images.zgallerie.com/is/image/ZGallerie/hero/tic-tac-toe-game-black-silver-181269802.jpg", description: "A game for two players, X and O, who take turns marking the spaces in a 3x3 grid. The player who succeeds in placing three of their marks in a horizontal, vertical, or diagonal row wins the game.", availability: "available")
GameDetail.create!(name: "Connect 4", image: "http://etoysandmore.com/wp-content/uploads/2015/12/81iqHu8134L._SL1500_.jpg", description: "A game for two players. The player who succeeds in placing four of their counters in a horizontal, vertical, or diagonal row wins the game.")
GameDetail.create!(name: "Battleships", image: "http://johnlewis.scene7.com/is/image/JohnLewis/233862525?$prod_main$", description: "Battleships...")


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
