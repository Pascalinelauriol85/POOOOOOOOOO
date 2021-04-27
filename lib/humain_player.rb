class HumainPlayer < Player

    attr_accessor :weapon_level

    def initialize(player)
        @weapon_level = 1
        super(player)
        @life_points = 100
    end

    def show_state()                                           # permet d'affiché a quel stade nous en sommes 
        puts "#{@player} a #{@life_points} points de vie et une arme de niveau #{weapon_level} !"
    end

    def compute_damage                                          # lance le des et le multiplie a l'arme
        rand(1..6) * @weapon_level
    end

    def search_weapon()                                          
        arms = rand(1..6)
        puts "Tu as trouvé une arme de niveau #{arms}"
        if @weapon_level < arms
            puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
            @weapon_level = arms
        else @weapon_level  >=  arms
            puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
        end
    end    

    def search_health_pack()
        pack = rand(1..6)

        if pack == 1
            puts "Tu n'as rien trouvé... "
            
        elsif pack == 6
            puts "Waow, tu as trouvé un pack de +80 points de vie !"
            @life_points + 80 > 100 ? (@life_points = 100) : (@life_points = @life_points + 80)
        
        else
            puts "Bravo, tu as trouvé un pack de +50 points de vie !"
            @life_points + 50 > 100 ? (@life_points = 100) : (@life_points = @life_points + 50)
        
        end
    end


end