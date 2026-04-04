class_name Orc extends Enemy
#Orc has a lot of health and deals a lot of damage, but takes a while to wind up attack
func _ready() -> void:
	health = 100
	damage = 50
	armor = 10
	speed = 20
func take_damage(amount: int, attack_roll: int) -> void:
	if attack_roll >= armor:
		health -= amount

func attack() -> int:
	return damage
	
func defend() -> int:
	return armor
func unique_move() -> void:
	print("Orc braces itself to take no damage!")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
