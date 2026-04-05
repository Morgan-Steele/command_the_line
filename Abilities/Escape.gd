extends Ability
class_name Escape
var base_escape
var luck
func _init(t_name, t_skill, t_aptitude, t_like, besc=10, lucky=5):
	super._init(t_name, t_skill, t_aptitude, t_like)
	base_escape=besc
	luck=lucky
func use(enemy):
	if enemy.speed < (base_escape + randi_range(0,luck) + Stats):
		StatsManager.in_combat = false
	else:
		StatsManager.health -= enemy.attack
		base_escape += 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
