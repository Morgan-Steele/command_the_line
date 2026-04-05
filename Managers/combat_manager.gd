extends Node
#var enemies = [Goblin, Orc, Fairy]
var current_enemy = null
var player_active = true
var current_overlay = null

var combat_overlay_scene = preload("res://Combat/combat_popup.tscn")
func start_combat(enemy):
	print("Start Combat")
	current_enemy = enemy
	zoom_camera(Vector2(2, 2))
	var overlay = combat_overlay_scene.instantiate()
	get_tree().root.add_child(overlay)
	current_overlay = overlay
	get_tree().paused = true
	overlay.setup(current_enemy)


func player_turn(player_action: String):
	print("Player turn function")
	if not player_active:
		return
	player_active = false
	match player_action:
		"attack": await StatsManager.abilities[0].use(current_enemy)
		"defend": await StatsManager.abilities[1].use(current_enemy)
		"escape": await StatsManager.abilities[2].use(current_enemy)
		"healing": await StatsManager.abilities[3].use(current_enemy)
		"non_combat": StatsManager.abilities[4].use(current_enemy)
	check_combat_end()
	if current_enemy:
		await get_tree().create_timer(1.0).timeout
		enemy_turn()
	
func enemy_turn():
	print("Enemy Turn")
	var enemy_action = (randi_range(0,2))
	match enemy_action:
		0: StatsManager.take_damage(await current_enemy.attack())
		1: current_enemy.defend()
		2: current_enemy.unique_move()
	player_active = true
	if current_overlay:
		current_overlay.update_display()
	check_combat_end()
	
func check_combat_end():
	if StatsManager.health <= 0:
		print("Player died!")
		end_combat()
	elif current_enemy == null or current_enemy.health <= 0:
		print("Enemy defeated!")
		end_combat()
	
func end_combat():
	zoom_camera(Vector2(1, 1))
	current_enemy = null
	get_tree().paused = false


func zoom_camera(target_zoom: Vector2):
	var camera = get_tree().get_first_node_in_group("camera")
	var tween = create_tween()
	tween.tween_property(camera, "zoom", target_zoom, 0.5)
