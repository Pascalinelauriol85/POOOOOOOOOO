class HumainPlayer < Player

    attr_accessor :weapon_level

    def initialize(player)
        @weapon_level = 1                        # l'arm initial est au niveau 1
        super(player)                            # j'appel la variable qui vient de la classe player
        @life_points = 100                       # point de vie du humain_playeur
    end

    def show_state()                                           # permet d'affiché a quel stade nous en sommes 
        puts "#{@player} a #{@life_points} points de vie et une arme de niveau #{weapon_level} !"
    end

    def compute_damage                                          # lance le des et le multiplie a l'arme
        rand(1..6) * @weapon_level
    end

    def search_weapon()                                          
        arms = rand(1..6)                                          # donne un nouveau niveau a l'arme
        puts "Tu as trouvé une arme de niveau #{arms}"
        if @weapon_level < arms                                    # si la nouvelle arme est plus grande que 1 alors il l'a prend
            puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
            @weapon_level = arms
        else @weapon_level  >=  arms                               # si l'arme est égale a 1 il ne fait rien
            puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
        end
    end    

    def search_health_pack()                                        # méthode santé                    
        pack = rand(1..6)                                           # lancé de dés

        if pack == 1                                                # si le des donne 1 alors il se passe rien
            puts "Tu n'as rien trouvé... "
            
        elsif pack == 6                                             # si le des donne 6 alors on ajoute 80 points
            puts "Waow, tu as trouvé un pack de +80 points de vie !"
            @life_points + 80 > 100 ? (@life_points = 100) : (@life_points = @life_points + 80)
                                                                    # si la somme depasse 100 on donne 100 sinon on met la somme
        else
            puts "Bravo, tu as trouvé un pack de +50 points de vie !" # si le des donne un chiffre de 2 à 6 alors on ajoute 50 points
            @life_points + 50 > 100 ? (@life_points = 100) : (@life_points = @life_points + 50)
                                                                       # si la somme depasse 100 on donne 100 sinon on met la somme
        end
    end


end