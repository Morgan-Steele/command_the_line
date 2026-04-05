extends Node
#var enemies = [Goblin, Orc, Fairy]
var current_enemy = null
var player_active = true

var combat_overlay_scene = preload("res://Combat/combat_popup.tscn")
func start_combat(enemy):
	current_enemy = enemy
	var overlay = combat_overlay_scene.instantiate()
	get_tree().root.add_child(overlay)
	get_tree().paused = true
	overlay.setup(current_enemy)


func player_turn(player_action: String):
	if not player_active:
		return
	player_active = false
	match player_action:
		"attack": StatsManager.abilities[0].use(current_enemy)
		"defend": StatsManager.abilities[1].use(current_enemy)
		"escape": StatsManager.abilities[2].use(current_enemy)
		"healing": StatsManager.abilities[3].use(current_enemy)
		"non_combat": StatsManager.abilities[4].use(current_enemy)
	await get_tree().create_timer(1.0).timeout
	enemy_turn()
	
func enemy_turn():
	var enemy_action = (randi_range(0,2))
	match enemy_action:
		0: StatsManager.take_damage(await current_enemy.attack())
		1: current_enemy.defend()
		2: current_enemy.unique_move()
	player_active = true
	
func end_combat():
	current_enemy = null
	get_tree().paused = false
