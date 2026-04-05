extends Ability
class_name Healing 
var base_heal
var luck

func _init(t_name, t_skill, t_aptitude, t_like, bheal=10, lucky=20):
	super._init(t_name, t_skill, t_aptitude, t_like)
	base_heal = bheal if bheal != -1 else t_skill / 5
	luck = lucky

func use(enemy):
	var heal=min(base_heal + randi_range(0, luck)+floor(StatsManager.abilities[3].skill/10), 20)
	StatsManager.health = min(StatsManager.max_health, StatsManager.health+heal)
	StatsManager.combat_desc+="Line restored "+str(heal)+" health points!\n"
