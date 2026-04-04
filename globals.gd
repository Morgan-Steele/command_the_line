extends Node
#line stats
var color
var texture #enum (solid, dashed, dotted, bold)
var end #enum (none, ball, arrow, diamond)
var affection #int 0-100
var obedience #int 0-100
	
#player stats
var coins #unsigned int
var health #unsigned int

abilities=[]

func initialize():
	

func train_ability(Ability ability, int cost):
	if(obedience+(ability.like*ability.training_level)>50):
		ability.skill+=ability.aptitude
		#check if affection high enough and 
		#chance it stabs you if not
	#else notify player that training failed
	affection+=ability.like
	coins-=cost #remember to check if enough coins before calling function
	#option should not be available if not enough coins
	
func obey(Ability ability): #returns boolean
	var RANDOM=randi_range(0,100)
	return obedience+(ability.like*20)>RANDOM
	#add support for pleading - change random range maybe?
	


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
