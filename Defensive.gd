extends Ability
class_name Defensive 
var base_block
var luck
func _init(t_name,t_skill,t_aptitude,t_like, bblock=skill/5, lucky=20):
	super._init(t_name,t_skill,t_aptitude,t_like)
	base_block=bblock
	luck=lucky
func use(damage):
	health-=(damage-(base_block+randi_range(0,luck)))

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
