extends Node
#enums
enum Texture {solid, dash, dotted, bold}
enum Topper {none, ball, arrow diamond}
enum Color {black, red, green, blue}

#line stats
var color #enum (black, red, green, blue)
var texture #enum (solid, dashed, dotted, bold)
var topper #enum (none, ball, arrow, diamond)
var affection #int 0-100
var obedience #int 0-100
	
#player stats
var coins #unsigned int
var health #unsigned int

abilities=[]

func initialize():
	health=100
	coins=0
	affection=20
	obedience=20
	randoms=[]
	for i in 4:
		randoms.append(randf_range(0,3))
	color=randoms[0]
	texture=randoms[1]
	topper=randoms[2]
	
	#make abilities
	

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
	
#func select (line selects preferred ability)
#used when disobeying or when allowed to make it's own choice
#needs a way to iterate through an array of all abilities?
func select():#returns
	

#func succeed (does ability succeed)
#returns boolean
#relies on: 
#affection(chance to purposely fail if low)
#enemy's paired stat: block-force dodge-speed attack?
#skill of ability


#func use_ability (combines obey, select, succeed)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
