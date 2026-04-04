extends Node2D
func train_ability(Ability ability, Line line, Player player, int cost):
	if(line.obedience+(ability.like*training_level)>50):
		ability.skill+=ability.aptitude
		#check if affection high enough and 
		#chance it stabs you if not
	#else notify player that training failed
	line.affection+=ability.like
	player.coins-=cost #remember to check if enough coins before calling function
	#option should not be available if not enough coins
	
func obey(Line line, Ability ability): #returns boolean
	var RANDOM=50 #replace with random num 0-100
	return line.obedience+(ability.like*20)>RANDOM
	#add support for pleading - change random range maybe?

#func succeed (does ability succeed)
#returns boolean
#relies on: 
#affection(chance to purposely fail if low)
#enemy's paired stat: block-force dodge-speed attack?
#skill of ability

#func select (line selects preferred ability)
#used when disobeying or when allowed to make it's own choice
#needs a way to iterate through an array of all abilities?

#func use_ability (combines obey, select, succeed)

class_name Enemy:
	var health #unsigned int
	var attack #Attack
	var block # int 0-? How hard they are to hit

class_name Attack:
	#offence stuff
	var name #string Cool Name
	var speed #unsigned int 0-100 How hard it is to dodge
	var force #unsigned int 0-100 How hard it is to block
	var damage #int
	
class_name Player:
	var coins #unsigned int
	var health #unsigned int

class_name Line:
	var color
	var texture #enum (solid, dashed, dotted, bold)
	var end #enum (none, ball, arrow, diamond)
	var affection #int 0-100
	var obedience #int 0-100
	func _init():
		
	
class_name Ability:
	var name #string
	var skill #int 0-100 - how good line is at it
	var aptitude #int 0-20? idk. It's how much the line improves each time it trains it
	var training_level #int num times trained
	var like #int -2 through 2 maybe? How much it likes it
		func _init():
			training_level=0
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
