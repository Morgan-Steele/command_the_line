extends Ability
class_name Non_Combat
var base_non_combat
var luck
func _init(t_name, t_skill, t_aptitude, t_like, bnoncombat=10, lucky=5):
	super._init(t_name, t_skill, t_aptitude, t_like)
	base_non_combat = bnoncombat
	luck=lucky
	
func use(enemy):
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
