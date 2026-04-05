extends CanvasLayer

func setup(enemy):
	$Panel/VBoxContainer/Label.text = "Enemy Health: " + str(enemy.health)
	$Panel/VBoxContainer/Label2.text = "Your Health: " + str(StatsManager.health)

func update_display():
	if CombatManager.current_enemy:
		$Panel/VBoxContainer/Label.text = "Enemy Health: " + str(CombatManager.current_enemy.health)
	$Panel/VBoxContainer/Label2.text = "Your Health: " + str(StatsManager.health)

func _on_attack_pressed():
	CombatManager.player_turn("attack")
	update_display()

func _on_defend_pressed():
	CombatManager.player_turn("defend")
	update_display()

func _on_heal_pressed():
	CombatManager.player_turn("healing")
	update_display()

func _on_escape_pressed():
	CombatManager.player_turn("escape")
	update_display()
