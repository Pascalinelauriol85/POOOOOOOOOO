class Game 

    attr_accessor :humain_player, :enemies_in_sight, :players_left 


    def initialize()                               
        @humain_player= HumainPlayer.new(name)                           
        @enemies_in_sight = []  
        @players_left = 4                           
    end 

    def kill_player(player)
        @enemies_in_sight = @enemies_in_sight.reject{ |enemie| enemie == player}
        @players_left -= 1
    end    

end 