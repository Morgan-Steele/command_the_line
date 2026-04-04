extends CanvasLayer
var current_enemy
@onready var combat_manager = get_node("../combat_manager")
func setup(enemy):
	current_enemy = enemy
	$enemy_name.text = enemy.name
	$enemy_health.text = "Health: " + str(enemy.health)
	$offensive_button.visible = true
	$defensive_button.visible = true
	$escape_button.visible = true
	$healing_button.visable = true
	$non_combat_button.visable = true

func _on_offensive_button_pressed():
	combat_manager.player_turn(current_enemy, "attack")
	update_ui()
func _on_defensive_button_pressed():
	combat_manager.player_turn(current_enemy, "defend")
	update_ui()
func _on_escape_button_pressed():
	combat_manager.player_turn(current_enemy, "escape")
	update_ui()
func _on_healing_button_pressed():
	combat_manager.player_turn(current_enemy, "healing")
	update_ui()
func _on_non_combat_button_pressed():
	combat_manager.player_turn(current_enemy, "non_combat")
	update_ui()
	
func update_ui():
	$enemy_health.text = "Health: " + str(current_enemy.health)
