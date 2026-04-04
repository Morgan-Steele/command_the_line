extends Node
var enemies = [Goblin, Orc, Fairy]
var current_enemy
@export var combat_overlay_scene: PackedScene

func start_combat():
	StatsManager.in_combat = true
	var chosen_enemy = enemies[randi_range(0, enemies.size()-1)]
	current_enemy = chosen_enemy.new()
	current_enemy.initialize()
	
	var overlay = combat_overlay_scene.instantiate()
	get_tree().root.add_child(overlay)
	overlay.setup(current_enemy)
	get_tree().paused = true


func player_turn(enemy, player_action):
	match player_action:
		"attack": StatsManager.abilities[0].use(enemy)
		"defend": StatsManager.abilities[1].use(enemy)
		"escape": StatsManager.abilities[2].use(enemy)
		"healing": StatsManager.abilities[3].use(enemy)
		"non_combat": StatsManager.abilities[4].use(enemy)
	
	
func enemy_turn():
	var enemy_action = (randi_range(0,2))
	match enemy_action:
		0: StatsManager.take_damage(current_enemy.attack())
		1: current_enemy.defend()
		2: current_enemy.unique_move()

func end_combat():
	current_enemy = null
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
