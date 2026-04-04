extends Node
class_name Ability:
	var name #string
	var skill #int 0-100 - how good line is at it
	var aptitude #int 0-20? idk. It's how much the line improves each time it trains it
	var training_level #int num times trained
	var like #int -2 through 2 maybe? How much it likes it
		func _init():
			training_level=0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
