extends Node
class_name Defensive extends Ability:
	var base_damage
	var luck
	func _init(bdam=10, lucky=5):
		super._init()
		base_damage=bdam
		luck=lucky
	func use(enemy):
		enemy.health-=base_damage+randi_range(luck)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
