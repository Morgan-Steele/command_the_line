extends Ability
class_name Escape
var base_escape
var luck
func _init(t_name, t_skill, t_aptitude, t_like, besc=0, lucky=5):
	super._init(t_name, t_skill, t_aptitude, t_like)
	base_escape=besc
	luck=lucky
func use(enemy):
	if enemy.speed < (randi_range(0,luck) + StatsManager.abilities[2].skill/50):
		StatsManager.in_combat = false
	else:
		StatsManager.health -= await enemy.attack()
		base_escape += 5
