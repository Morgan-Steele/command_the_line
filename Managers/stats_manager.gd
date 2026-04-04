extends Node
#enums
enum Pattern {solid, dash, dotted, bold}
enum Topper {none, ball, arrow, diamond}
enum Colour {black, red, green, blue}

#line stats
var colour #enum (black, red, green, blue)
var pattern #enum (solid, dashed, dotted, bold)
var topper #enum (none, ball, arrow, diamond)
var affection #int 0-100
var obedience #int 0-100
	
#player stats
var coins #unsigned int
var health #unsigned int

var abilities = []

func initialize():
	health=100
	coins=0
	affection=20
	obedience=20
	var randoms=[]
	for i in 4:
		randoms.append(randf_range(0,3))
	colour=randoms[0]
	pattern=randoms[1]
	topper=randoms[2]
	
	#make abilities
	abilities.append(Offensive.new("Sword", randf_range(0,50),randf_range(0,100),0))
	abilities.append(Defensive.new("Shield", randf_range(0,50),randf_range(0,100),0))
	abilities.append(Escape.new("Helicopter", randf_range(0,50),randf_range(0,100),0))
	abilities.append(Healing.new("Magic Staff", randf_range(0,50),randf_range(0,100),0))
	abilities.append(Non_Combat.new("Non Combat", randf_range(0,50),randf_range(0,100),0))
	
	
	#assign likes and dislikes
	var likes=[-2,-1,0,1,2]
	likes.shuffle()
	for i in 5:
		abilities[i]=likes[i]

func train_ability(ability, cost): #Ability, int
	if(obedience+(ability.like*ability.training_level)>50):
		ability.skill+=ability.aptitude
		#check if affection high enough and 
		#chance it stabs you if not
	#else notify player that training failed
	affection+=ability.like
	coins-=cost #remember to check if enough coins before calling function
	#option should not be available if not enough coins
	
func obey(ability): #returns boolean
	var RANDOM=randi_range(0,100)
	return obedience+(ability.like*20)>RANDOM
	#add support for pleading - change random range maybe?
	
#func select (line selects preferred ability)
#used when disobeying or when allowed to make it's own choice
#needs a way to iterate through an array of all abilities?
func select():#returns selected ability
	var ranges=[]
	for i in 5:
		ranges.append((abilities[i].like*7)+20)
	var selected=randi_range(0,100)
	if selected<ranges[0]:
		return abilities[0]
	if selected<(ranges[0]+ranges[1]):
		return abilities[1]
	if selected<(ranges[0]+ranges[1]+ranges[2]):
		return abilities[2]
	if selected<(ranges[0]+ranges[1]+ranges[2]+ranges[3]):
		return abilities[3]
	return abilities[4]
		
	

#func succeed (does ability succeed)
#returns boolean
#relies on: 
#affection(chance to purposely fail if low)
#enemy's paired stat: block-force dodge-speed attack?
#skill of ability

#How much damage the player takes from the enemy
func take_damage(attack):
	health -= attack

#func use_ability (combines obey, select, succeed)
func use_ability(sel_ability):
	var ability
	# Temporary hardcode to run
	var succeed = true
	if obey(sel_ability):
		ability=sel_ability
	else:
		ability=select()
	if(succeed):
		ability.use

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
