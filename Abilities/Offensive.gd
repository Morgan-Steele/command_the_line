extends Ability
class_name Offensive
var base_damage
var luck
func _init(t_name, t_skill, t_aptitude, t_like, bdam=10, lucky=10):
	super._init(t_name, t_skill, t_aptitude, t_like)
	base_damage=bdam
	luck=lucky
func use(enemy):
	var damage=base_damage+randi_range(0, luck)+(floor(StatsManager.abilities[0].skill/10))
	enemy.health=max(0,enemy.health-damage)
	StatsManager.combat_desc+="Line dealt "+str(damage)+" damage!\n"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
