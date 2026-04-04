class_name Orc extends Enemy
#Orc has a lot of health and deals a lot of damage, but takes a while to wind up attack
@onready var _animated_sprite = $AnimatedSprite2D

func _ready() -> void:
	health = 100
	damage = 50
	armor = 10
	speed = 20
	_animated_sprite.play("idle")
	
func _process(_delta):
	pass

func take_damage(amount: int, attack_roll: int) -> void:
	if attack_roll >= armor:
		health -= amount

func attack() -> int:
	_animated_sprite.play("attack")
	await _animated_sprite.animation_finished
	_animated_sprite.play("idle")
	return damage
	
func defend() -> int:
	return armor
func unique_move() -> void:
	print("Orc braces itself to take no damage!")
# Called every frame. 'delta' is the elapsed time since the previous frame.
