extends Ability
class_name Healing
var base_heal
func _init(t_name,t_skill,t_aptitude,t_like, bheal=skill/5):
	super._init(t_name,t_skill,t_aptitude,t_like)
	base_heal=bheal
	
func use(heal):
	health += base_heal
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
