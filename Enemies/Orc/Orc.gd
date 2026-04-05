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

func _on_proximity_area_body_entered(body):
	if body.name == "player":
		StatsManager.in_combat = true
		CombatManager.start_combat()

func take_damage(amount: int, attack_roll: int) -> void:
	if attack_roll >= armor:
		health -= amount
		if health <= 0:
			_animated_sprite.play("Death")
			die()
			StatsManager.in_combat = false

func die():
	queue_free()

func attack() -> int:
	_animated_sprite.play("Attack")
	await _animated_sprite.animation_finished
	_animated_sprite.play("idle")
	return damage
	
func defend() -> int:
	return armor
func unique_move() -> void:
	print("Orc braces itself to take no damage!")
# Called every frame. 'delta' is the elapsed time since the previous frame.
