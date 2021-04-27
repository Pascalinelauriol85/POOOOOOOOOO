class Game 

    attr_accessor :humain_player, :enemies_in_sight, :players_left 


    def initialize()                               
        @humain_player= HumainPlayer.new(name)                           
        @enemies_in_sight = []  
        @players_left = 4 
        @life_points = 100  
        @weapon_level =1                        
    end 

    def kill_player(player)
        @enemies_in_sight = @enemies_in_sight.reject{ |enemie| enemie == player}
        @players_left -= 1
    end    

    def is_still_ongoing?()
        if humain_player.life_points >= 0 && @enemies_in_sight.leight =! 0
            return true
        else
            return false        
        end 
    end

    def show_players()
            puts "#{humain_player} a #{@life_points} points de vie et une arme de niveau #{weapon_level} !"
                    
    end

      

end 