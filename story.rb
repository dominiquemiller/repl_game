# install colorize on your system to see the text colorize
# type gem install colorize from terminal
require "rubygems"
require "colorize"
require "./storymodule.rb"
include StoryModule
#master class that all other classes inherit from
class Creatures
	attr_accessor :life, :attack, :defense, :inventory, :name

	def initialize(life=30, attack=0, defense=0, inventory=[])
		@name = name
		@life = life
		@attack = attack
		@defense = defense
		@inventory = inventory
	end

	def fight(player, monster)
		damage = rand(8) + player.attack
		if damage >= 0
			monster.life -= damage
			if monster.life < 0
				puts "You hit for #{damage} and killed the monster!".red
			else
				puts " You hit the monster for #{damage}! The monster has #{monster.life} life left.".red
				sleep 1
				puts "Now it's the monsters turn!"
			end
		end

		damage = rand(8) - player.defense
		if damage >= 0
			player.life -= damage
			if player.life < 0
				puts "The monster hits you for #{damage}! You dead sucka!"
				exit
			else
				puts "Monster hits you for #{damage}! You have #{player.life} life left."
				sleep 1
			end
		end
	end

	def potion(player)
		player.life += 10
		puts "After drinking the magical potion a strange feeling comes over you...you begin feeling sick!"
		sleep 2
		puts "....."
		sleep 2
		puts "The sickness vanishes and you feel revitalized! It was a potion of healing! You now have #{player.life} life!"
	end
end

class Player < Creatures

end

class Monster < Creatures

end
#auto created player/monsters
@hero = Player.new
@dragon = Monster.new(30)

def start
	puts <<-INTRO
	****************************************************************************************************
	Welcome to Rubyland where you will most likely die!

	First a few groundrules and info:
	1. Just like old school games you will roll dice to decide your fate.
	2. Monsters will randomly appear in your path, if not you will see "All is clear"
	3. You have a chance to collect an item or two for your inventory
	4. Rubyland is a fictional place, duh, and closely resembles feudal europe but with
	monsters. Yeehaw!
	*****************************************************************************************************
	INTRO

	sleep 7
	puts "First I need to know your name:".white.on_red.blink
	@hero.name = gets.chomp
	puts "Welcome #{@hero.name}!"
	sleep 1
	puts <<-ONCE
	Once upon a time in a galaxy far, far, away lived #{@hero.name}....
	You are hanging out in your luxury hut bored out of your mind.  You think
	to yourself, "Hmmm..would it be fun to see whats around me?"
	Local rumor has it that a large cat dragon is torturing  100 little cats! This
	sick creature lines up the cats and puts hats on them and then removes them,
	all day long!  This surely is the purest form of evil!

	Let fate decide your direction #{@hero.name}, time to roll that 4 sided die!"
	ONCE
	sleep 6
	puts "Please type roll to roll the die.".blue
	rolled = gets.chomp.downcase.to_s

	if rolled == "roll"
		roll_dice
	else
		wrong_answer
	end
end

def roll_dice
	roll = rand(4)
	puts "ok, #{@hero.name}, it looks like you rolled a #{roll}!"
	if roll > 2
		north
	else
		south
	end
end

def encounter
	@random_monster = Monster.new(5)
	chance = rand(4)
	if chance >= 2
		puts "A monster has appeared! You must fight!"
		while @hero.life > 0 && @random_monster.life > 0 do
			@hero.fight(@hero, @random_monster)
		end
	else
		puts "So far so good, all is clear!"
	end
end

def north
	puts "You decide to head north!"
	sleep 1
	scavenge
	encounter
	sleep 3
	travel_doc
	sleep 2
	continue_adventure
	sleep 6
	encounter
	sleep 1
	castle_enter
end

def travel_doc
	puts <<-EOP

	You travel on a simple dirt road for hours and
	hours. Soon darkness comes.  You sleep under a large tree and resume your
	travels at daybreak.

	EOP
end

def south
	puts "You decide to head south!"
	scavenge
	sleep 1
	encounter
	travel_doc
	sleep 2
	continue_adventure
	sleep 3
	castle_enter
end

def castle_enter
	puts "You reach a large castle! Do you enter? Yes or no?".white.on_blue
	prompt = gets.chomp.downcase
	if prompt == "yes"
		puts "You have entered the castle"
		sleep 1
		encounter
		castle
	elsif prompt == "no"
		puts "Are you scared? Try again!"
		start
	else
		wrong_answer
	end
end

def castle
	puts "The castle is a very vast and cavernous. Do you want to search the area? Yes or no?".white.on_blue
	prompt = gets.chomp.downcase
	if prompt == "yes"
		puts "You search the area and come across a healing potion! You drink the potion."
		sleep 1
		@hero.potion(@hero)
	end
	sleep 1
	encounter
	castle_second_choice
end

def castle_second_choice
	puts "In this vast open space you notice only one door. Do you open the door? Yes or no.".white.on_blue
	answer =gets.chomp.downcase
	if answer == "yes"
		puts "You open the door and enter."
		castle_room
	else
		puts "Really? You want to start over? Ok.."
		start
	end
end

def dragon
	puts "Suddonly you are confronted with a large cat dragon!".yellow.on_black.blink
	puts "You will never get to my little cat hats!"
	sleep 2
	puts "The dragon says 'Stupid creature! I kill you now!'".red.blink
	sleep 2
	if @hero.inventory.length > 0
		puts "You got this! You have a#{@hero.inventory} to help you!"
	else
		puts "You don't have a choice, you have to battle!"
	end
	continue_adventure
	while @hero.life > 0 && @dragon.life > 0 do
		@hero.fight(@hero, @dragon)
	end
end

def castle_room
	puts <<-ROOM
	All the walls of this room seem to be made of marble.
	On the back wall is an inscription.
	Its hard to make out.
	ROOM
	sleep 2
	puts "Would you like to walk up to the inscription? Yes or no?".white.on_blue
	response = gets.chomp.downcase
	if response == "yes"
		puts "You walk up to the wall and read the inscription.."
		puts "Beware of the cat hat maniac!"
	else
		wrong_answer
	end
	scavenge
	sleep 1
	choice
end

def choice
	puts "You notice a door to the left and the right of the inscription."
	puts "Will you go left or right?".white.on_blue
	response = gets.chomp.downcase
	if response == "left" || response == "right"
		puts "You open the door and walk into a very large hall..."
		dragon
	else
		wrong_answer
	end
end

def continue_adventure
	puts "When your ready to continue, please type begin or ready or start".white.on_blue
	response = gets.chomp.downcase
	if (response == "begin" || response == "ready" || response == "start")
		puts "..."
	else
		wrong_answer
	end
end

def wrong_answer
	puts "Damn you dumb, cant even type simple commands!"
end
# the actual program starts here! Not sure if thats a good or bad thing..
start

if @dragon.life <= 0
	puts "You killed the dragon, the kingdom is now safe!".yellow.on_black.blink
end
# future add-ons include: evolve the combat to be more interactive
# add more inventory items
