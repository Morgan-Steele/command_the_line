extends Node

var current_enemy = null
var player_active = true
var current_overlay = null  # Combat popup screen
var combat_overlay_scene = preload("res://Combat/combat_popup.tscn")

# Entry Point for fight. Shows popup and pauses.
func start_combat(enemy):
	zoom_camera(Vector2(2, 2))
	await get_tree().create_timer(0.6).timeout  # wait for zoom to finish
	print("Start Combat")
	StatsManager.user_turn = true
	current_enemy = enemy
	var overlay = combat_overlay_scene.instantiate()
	get_tree().root.add_child(overlay)
	current_overlay = overlay
	get_tree().paused = true
	overlay.setup(current_enemy)

# Action from selected combat_popup button is triggered
func player_turn(player_action: String):
	print("Player turn function")
	if not StatsManager.user_turn or not player_active:
		return
	player_active = false
	match player_action:
		"attack": await StatsManager.use_ability(StatsManager.abilities[0],current_enemy)
		"defend": await StatsManager.use_ability(StatsManager.abilities[1],current_enemy)
		"escape": await StatsManager.use_ability(StatsManager.abilities[2],current_enemy)
		"healing": await StatsManager.use_ability(StatsManager.abilities[3],current_enemy)
		"non_combat": await StatsManager.use_ability(StatsManager.abilities[4],current_enemy)
		#"attack": await StatsManager.abilities[0].use(current_enemy)
		#"defend": await StatsManager.abilities[1].use(current_enemy)
		#"escape": await StatsManager.abilities[2].use(current_enemy)
		#"healing": await StatsManager.abilities[3].use(current_enemy)
		#"non_combat": StatsManager.abilities[4].use(current_enemy)
	await check_combat_end() # Kill dead people
	if current_enemy == null:
		return
	# Enemy gets a turn after 1 second
	StatsManager.user_turn = false
	await get_tree().create_timer(1.0).timeout
	enemy_turn()
	
# Enemy choses and performs action
func enemy_turn():
	if StatsManager.user_turn:
		return
	print("Enemy Turn")
	var enemy_action = (randi_range(0,7))
	match enemy_action:
		0: StatsManager.take_damage(await current_enemy.attack())  # Attack user
		1: StatsManager.take_damage(await current_enemy.attack())
		2: StatsManager.take_damage(await current_enemy.attack())
		3: current_enemy.heal()
		4: current_enemy.unique_move()
		5: StatsManager.take_damage(await current_enemy.attack())
		6: StatsManager.take_damage(await current_enemy.attack())
	player_active = true
	StatsManager.user_turn = true
	if current_overlay:
		current_overlay.update_display()
	check_combat_end()
	
# Play death scene for losing party
func check_combat_end():
	if current_enemy == null:
		return
	print("Enemy health: ", current_enemy.health)
	print("Player health: ", StatsManager.health)
	if StatsManager.health <= 0:
		print("About to kill player")
		get_tree().paused = false
		if current_overlay:
			current_overlay.queue_free()
			current_overlay = null
		StatsManager.combat_desc = "You lost the fight!"
		var player = get_tree().get_first_node_in_group("player")
		await player.die()
		zoom_camera(Vector2(1, 1))
		end_combat()
	elif current_enemy.health <= 0:
		print("About to kill enemy")
		StatsManager.combat_desc = "You won the fight!"
		get_tree().paused = false
		if current_overlay:
			current_overlay.queue_free()
			current_overlay = null
		await current_enemy.die()
		StatsManager.coins+=randi_range(5,100)
		zoom_camera(Vector2(1, 1))
		end_combat()
	
# Final cleanup after combat
func end_combat():
	print("End combat called")
	zoom_camera(Vector2(1, 1))
	if current_overlay:
		current_overlay.queue_free()
		current_overlay = null
	current_enemy = null
	StatsManager.in_combat = false
	StatsManager.user_turn = true
	get_tree().paused = false # Unpause everything
	

func escape_combat():
	current_overlay.queue_free()
	if current_enemy:
		current_enemy.queue_free() 
	current_overlay = null
	current_enemy = null
	StatsManager.in_combat = false
	StatsManager.user_turn = true
	zoom_camera(Vector2(1, 1))
	get_tree().paused = false

# Adjust camera following player
func zoom_camera(target_zoom: Vector2):
	var camera = get_tree().get_first_node_in_group("camera")
	var tween = create_tween()
	tween.tween_property(camera, "zoom", target_zoom, 0.5)
