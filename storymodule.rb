module StoryModule
  def scavenge
    puts " Would you like to scavenge the area? Yes or no?".white.on_blue
    prompt = gets.chomp.downcase
    if prompt == "yes"
      search
    else
      puts "You dummy, you could have found some good @#%&!"
    end
  end

  def search
    rand(20)
    if rand <= 18
      puts "You search the area and find something!"
      loot
    else
      puts "You search the area and find nothing."
    end
  end

  def sword
    @hero.attack += 2
  end

  def axe
    @hero.attack += 2
  end

  def shield
    @hero.defense += 2
  end

  def gloves
    @hero.defense += 2
  end

  def loot
    roll = rand(20)
    if roll <= 5
      if @hero.inventory.include?("sword")
        puts "You found another sword, but you can only have 1! Sorry!"
      else
        @hero.inventory << "sword"
        puts "Hell fire! You found a sword! Extra attack damage! Yeehaw!".white.on_red.blink
        sword
      end
    elsif roll.between?(6, 10)
      if @hero.inventory.include?("shield")
        puts "You found another shield, but you can only have 1! Sorry!"
      else
        @hero.inventory << "shield"
        puts "Damn son, you got a shield! Defense be better!".white.on_blue.blink
        shield
      end
    elsif roll.between?(11, 15)
      if @hero.inventory.include?("axe")
        puts "You found another axe, but you can only have 1! Sorry!"
      else
        @hero.inventory << "axe"
        puts "Hell fire! You found an axe! Extra attack damage! Yeehaw!".white.on_red.blink
        axe
      end
    else
      if @hero.inventory.include?("gloves")
        puts "You found another gloves, but you can only have 1! Sorry!"
      else
        @hero.inventory << "gloves"
        puts "Damn son, you got gloves! Defense be better!".white.on_blue.blink
        gloves
      end
    end
    puts "Your inventory now includes #{@hero.inventory}!"
    sleep 3
  end


end
