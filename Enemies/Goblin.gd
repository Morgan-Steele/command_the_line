class_name Goblin extends Enemy

#Base stats of the enemy, Goblin has low health but attacks fast & multiple times
func _ready() -> void:
	health = 40
	damage = 10
	armor = 20
	speed = 40

func take_damage(amount: int, attack_roll: int) -> void:
	if attack_roll > armor:
		health -= amount
		if health <= 0:
			die()
	else:
		print("Miss")

func die():
	queue_free()

func attack() -> int:
	return randi_range(damage - 5, damage + 5)
	
func defend() -> int:
	return randi_range(armor - 5, armor + 5)
	
func unique_move() -> void:
	print("Goblin taunts so you must attack!")
func _process(delta: float) -> void:
	pass
