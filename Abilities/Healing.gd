extends Ability
class_name Healing 
var base_heal
var luck

func _init(t_name, t_skill, t_aptitude, t_like, bheal=-1, lucky=20):
	super._init(t_name, t_skill, t_aptitude, t_like)
	base_heal = bheal if bheal != -1 else t_skill / 5
	luck = lucky

func use(enemy):
	StatsManager.health = min(StatsManager.max_health, StatsManager.health + base_heal + randi_range(0, luck))
