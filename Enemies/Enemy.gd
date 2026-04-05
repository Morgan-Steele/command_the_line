@abstract
extends CharacterBody2D
class_name Enemy
var health: int
var damage: int
var armor: int
var speed: int
var direction = -1

@abstract func take_damage(amount: int, attack_roll: int) -> void
@abstract func attack() -> int
@abstract func defend() -> int
@abstract func heal() -> int
@abstract func unique_move() -> void

func _physics_process(delta: float) -> void:
	if StatsManager.in_combat:
		velocity = Vector2.ZERO
		return
	velocity.x = speed * direction
	
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	move_and_slide()

	
