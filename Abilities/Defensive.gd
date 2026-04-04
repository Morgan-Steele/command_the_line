extends Ability
class_name Defensive 
var base_block
var luck

func _init(t_name,t_skill,t_aptitude,t_like, bblock=skill/5, lucky=20):
	super._init(t_name,t_skill,t_aptitude,t_like)
	base_block=bblock
	luck=lucky
func use(enemy):
	var blocked = base_block + randi_range(0, luck)
	var damage = enemy.attack()
	StatsManager.health -= max(0, damage - blocked)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
