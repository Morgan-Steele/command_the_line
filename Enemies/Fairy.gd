class_name Fairy extends Enemy


#Fairy has very little health and damage, but is very hard to hit
func _ready() -> void:
	health = 10
	damage = 5
	armor = 30

func take_damage(amount: int, attack_roll: int) -> void:
	if attack_roll >= armor:
		health -= amount

func attack() -> int:
	return damage
	
func defend() -> int:
	return armor
	
func unique_move() -> void:
	print("Fairy makes your line fall asleep for a turn!")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
