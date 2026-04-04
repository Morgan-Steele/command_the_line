extends Ability
class_name Healing 
var base_heal
var luck

func _init(t_name,t_skill,t_aptitude,t_like, bheal=skill/5, lucky=20):
	super._init(t_name,t_skill,t_aptitude,t_like)
	base_heal=bheal
	luck=lucky
	
func use(enemy):
	StatsManager.health += base_heal + randi_range(0, luck)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
