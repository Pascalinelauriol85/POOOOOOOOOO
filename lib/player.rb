class Player 

    attr_accessor :player, :life_points                  # je déclare mes variable en lecture et ecriture simple

    def initialize(player)                               # méthode initialize pour intialiser les variables
        @player = player.to_s                            # playeur en string sera utilisé dans toute la méthode
        @life_points = 10                                # nombre de point de vie initialisé au départ 
    end 

    def show_state()                                           # permet d'affiché a quel stade nous en sommes 
        "#{@player} a #{@life_points} points de vie !"    # le joueur => nombre de point de vie
    end

    def gets_damage(damages)                                    # méthode de point de domage
        @life_points = @life_points - damages                   # nombre de point de vie moins la variable de domage
        if @life_points <= 0                                            
          puts "\033[1;31mLe joueur #{@player} est mort(e) !"+"\033[0m"   # couleur sur le texte
          @life_points = 0
        end
    end
    
    def attacks(player_attacked)                                            # nouvelle variable de player attaqué
        puts "Le joueur #{@player} attaque le joueur #{player_attacked.player}" 
        damages = compute_damage()                                         # variable egal au lancé de dés
        puts "Il lui inflige #{damages} point(s) de dommage(s)"
        player_attacked.gets_damage(damages)                               # appel la méthode gets.damage
    end

    def compute_damage
        return rand(1..6)                                                   # lancer de dés
      end

end


