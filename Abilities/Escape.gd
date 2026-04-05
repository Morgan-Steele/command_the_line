extends Ability
class_name Escape
var base_escape
var luck
func _init(t_name, t_skill, t_aptitude, t_like, besc=0, lucky=5):
	super._init(t_name, t_skill, t_aptitude, t_like)
	base_escape=besc
	luck=lucky
func use(enemy):
	var escape_roll = randi_range(0, 100) + StatsManager.abilities[2].skill + base_escape
	var difficulty = enemy.speed * 2
	if escape_roll > difficulty:
		StatsManager.combat_desc = "Line managed to escape!\n"
		CombatManager.escape_combat()
	else:
		var damage = await enemy.attack()
		StatsManager.health -= damage
		StatsManager.combat_desc = "Escape failed! Took " + str(damage) + " damage!\n"
		base_escape += 5
