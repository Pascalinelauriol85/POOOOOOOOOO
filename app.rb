require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


player1 = Player.new("Jojo le tueur")
player2 = Player.new("Jacqueline la killeuse")
puts "Voici l'état de chaque joueur :"
puts "-------------------------------"         
player1.show_state                            # méthode show qui affiche le nombre de vie et le nom
player2.show_state
puts "-------------------------------"

# Tant que le player 1 ou player 2 ne sont pas mort on continu
while player2.life_points > 0 && player1.life_points > 0
  puts ""
  puts "\033[1;32mPassons à la phase d'attaque :"+"\033[0m"
  player2.attacks(player1)         # on appel la méthode qui permet au player 2 d'attaquer le player 1
  if player1.life_points <= 0      # si les point de player 1 sont égale a 0 on s'arret
    break
  else
    player1.attacks(player2)        # on alterne c'est le player 1 qui attaque le player 2  
  end
end

# binding.pry 
# puts "finnnnnn"