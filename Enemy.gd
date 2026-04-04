@abstract class_name Enemy
var health: int
var damage: int
var armor: int

func _ready() -> void:
	pass
func _process(delta: float) -> void:
	pass

@abstract func take_damage(amount: int) -> void
@abstract func attack() -> void
