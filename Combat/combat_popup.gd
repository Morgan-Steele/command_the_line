extends CanvasLayer

func setup(enemy):
	$Panel/VBoxContainer/Label.text = "Enemy Health: " + str(enemy.health)
	#$Panel/VBoxContainer/Label2.text = "Your Health: " + str(StatsManager.health)

func update_display():
	if CombatManager.current_enemy:
		$Panel/VBoxContainer/Label.text = "Enemy Health: " + str(CombatManager.current_enemy.health)
	#$Panel/VBoxContainer/Label2.text = "Your Health: " + str(StatsManager.health)

func _on_attack_button_pressed() -> void:
	print("Attack pressed")
	var player = get_tree().get_first_node_in_group("player")
	player.get_node("AnimatedSprite2D").play("attack")
	await player.get_node("AnimatedSprite2D").animation_finished
	CombatManager.player_turn("attack")
	update_display()
	print("Attack Finished")

func _on_defend_button_pressed() -> void:
	print("Defend pressed")
	var player = get_tree().get_first_node_in_group("player")
	player.get_node("AnimatedSprite2D").play("defend")
	await player.get_node("AnimatedSprite2D").animation_finished
	CombatManager.player_turn("defend")
	update_display()

func _on_escape_button_pressed() -> void:
	print("Escape pressed")
	var player = get_tree().get_first_node_in_group("player")
	player.get_node("AnimatedSprite2D").play("escape")
	await player.get_node("AnimatedSprite2D").animation_finished
	CombatManager.player_turn("escape")
	update_display()

func _on_heal_button_pressed() -> void:
	print("Heal pressed")
	var player = get_tree().get_first_node_in_group("player")
	player.get_node("AnimatedSprite2D").play("heal")
	await player.get_node("AnimatedSprite2D").animation_finished
	CombatManager.player_turn("heal")
	update_display()
