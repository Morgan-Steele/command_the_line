extends Node
var stat_manager
var enemies = [Goblin, Orc, Fairy]
var current_enemy
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	stat_manager = get_node("../stats_manager")

func start_combat():
	var chosen_enemy = enemies[randi_range(0, enemies.size()-1)]
	var current_enemy = chosen_enemy.new()
	current_enemy.initialize()

func player_turn(enemy, player_action):
	match player_action:
		"attack": stat_manager.abilites[0].use(enemy)
		"defend": stat_manager.abilites[1].use(enemy)
		"escape": stat_manager.abilites[2].use(enemy)
		"healing": stat_manager.abilites[3].use(enemy)
		"non_combat": stat_manager.abilites[4].use(enemy)
	
	
func enemy_turn():
	var enemy_action = (randi_range(0,2))
	match enemy_action:
		0: stat_manager.take_damage(current_enemy.attack())
		1: current_enemy.defend()
		2: current_enemy.unique_move()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
