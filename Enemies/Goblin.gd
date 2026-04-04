class_name Goblin extends Enemy


#Base stats of the enemy, Goblin has low health but attacks fast & multiple times
func _ready() -> void:
	health = 40
	damage = 10
	armor = 20

func take_damage(amount: int, attack_roll: int) -> void:
	if attack_roll > armor:
		health -= amount
	else:
		print("Miss")

func attack() -> int:
	return damage
	
func defend() -> int:
	return armor
	
func unique_move() -> void:
	print("Goblin taunts so you must attack!")
func _process(delta: float) -> void:
	pass
