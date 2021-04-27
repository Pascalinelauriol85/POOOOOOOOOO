require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/humain_player'


puts "----------------------------------------------------------------"
puts "|                                                              |"
puts "|           Bienvenue sur 'ILS VEULENT TOUS MA POO' !          |"
puts "|         Le but du jeu est d'être le dernier survivant !      |"
puts "|                                                              |"
puts "----------------------------------------------------------------"


puts "Quel est ton prénom ?"
name = gets.chomp

humain_player = HumainPlayer.new(name)


    # la variable enemies est un tableau
enemies =[]
    # je met les nouveaux joueurs dans un tableau
enemies << player1 = Player.new("Jojo le tueur")
enemies << player2 = Player.new("Jacqueline la killeuse")



    # tant que le player humain a plus de 0pts ou si l'un des deux joueurs ordi a plus de 0pts on continue
    while humain_player.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
        
        puts "-------------------------------"         # affiche du menu
        puts "-------------------------------"
        puts "\033[1;32mQuelle action veux-tu effectuer ?"+"\033[0m"
        puts "-------------------------------"
        puts "a - chercher une meilleure arme"
        puts "s - chercher à se soigner" 
        puts " "
        puts "Attaquer un joueur en vue :"
        puts "-------------------------------"
        puts "1 - #{player1.show_state}"                     # méthode show qui affiche le nombre de vie et le nom
        puts "2 - #{player2.show_state}"
        puts "-------------------------------"
        puts "#{humain_player.show_state}"


        choose_humain = gets.chomp                        # choix de l'humain

        if choose_humain == "a"
            humain_player.search_weapon                   # choix de l'arme
            gets.chomp
        elsif choose_humain == "s"
            humain_player.search_health_pack              # choix de se soigner
            gets.chomp
        elsif choose_humain == "1"
            humain_player.attacks(player1)               # attaquer player 1
            gets.chomp
        elsif choose_humain == "2"
            humain_player.attacks(player2)                # attaquer player 2
            gets.chomp
        else
            puts "Tu dois choisir entre a, s, 1 ou 2"
            gets.chomp
        end
        # on cherche dans le tableau ennemis. Pour chaques joueurs, on regarde les points de vie 
        #si ils sont supperieur a 0 on peut attaquer sinon on fait rien.
        enemies.each {|item| item.life_points > 0 ? item.attacks(humain_player) : nil}
        gets.chomp
    end

    
        puts "La partie est finie"
      if humain_player.life_points > 0
        # affiche si le player humain a gagné
        puts "\033[1;31mBRAVO ! TU AS GAGNE !"+"\033[0m"
      else 
        #affiche si le player humain a perdu
        puts "\033[1;31mLoser ! Tu as perdu !"+"\033[0m"
    end



    
# binding.pry 
# puts "finnnnnn"