extends Node
var enemies = [Goblin, Orc, Fairy]
var current_enemy
var player_active = true
@export var combat_overlay_scene: PackedScene
var combat_popup_scene = preload("res://Combat/combat_popup.gd")
func start_combat(enemy):
	#This can be changed based on detection.
	current_enemy = enemy.new()
	current_enemy.initialize()
	
	var overlay = combat_overlay_scene.instantiate()
	get_tree().root.add_child(overlay)
	overlay.setup(current_enemy)
	get_tree().paused = true


func player_turn(enemy, player_action):
	if not player_active:
		return
	player_action = false
	match player_action:
		"attack": StatsManager.abilities[0].use(enemy)
		"defend": StatsManager.abilities[1].use(enemy)
		"escape": StatsManager.abilities[2].use(enemy)
		"healing": StatsManager.abilities[3].use(enemy)
		"non_combat": StatsManager.abilities[4].use(enemy)
	await get_tree().create_timer(1.0).timeout
	enemy_turn()
	
func enemy_turn():
	var enemy_action = (randi_range(0,2))
	match enemy_action:
		0: StatsManager.take_damage(current_enemy.attack())
		1: current_enemy.defend()
		2: current_enemy.unique_move()
	
	player_active = true

func end_combat():
	current_enemy = null
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
