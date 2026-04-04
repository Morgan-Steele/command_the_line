@abstract
extends Node
class_name Enemy
var health: int
var damage: int
var armor: int

func _ready() -> void:
	pass
func _process(delta: float) -> void:
	pass

@abstract func take_damage(amount: int, attack_roll: int) -> void
@abstract func attack() -> int
@abstract func defend() -> int
@abstract func unique_move() -> void
