extends CanvasLayer

func setup(enemy):
	$Panel/VBoxContainer/Label.text = "Enemy Health: " + str(enemy.health)
	$TurnLabel.text = "Your Turn!"

# Update visuals of stats
func update_display():
	$Panel/VBoxContainer/attack_button.disabled = not StatsManager.user_turn
	$Panel/VBoxContainer/escape_button.disabled = not StatsManager.user_turn
	$Panel/VBoxContainer/heal_button.disabled = not StatsManager.user_turn
	$Label.text = StatsManager.combat_desc
	StatsManager.combat_desc=""
	if CombatManager.current_enemy:
		$Panel/VBoxContainer/Label.text = "Enemy Health: " + str(CombatManager.current_enemy.health)
	var player = get_tree().get_first_node_in_group("player")
	player.get_node("ProgressBar").value = StatsManager.health
	if StatsManager.user_turn:
		$TurnLabel.text = "Your Turn!"
	else:
		$TurnLabel.text = "Enemy's Turn!"

func _on_attack_button_pressed() -> void:
	print("Attack pressed")
	var player = get_tree().get_first_node_in_group("player")
	player.get_node("AnimatedSprite2D").play("attack")
	await player.get_node("AnimatedSprite2D").animation_finished
	CombatManager.player_turn("attack")
	update_display()
	print("Attack Finished")


func _on_escape_button_pressed() -> void:
	print("Escape pressed")
	var player = get_tree().get_first_node_in_group("player")
	player.get_node("AnimatedSprite2D").play("escape")
	await get_tree().create_timer(0.5).timeout
	await player.get_node("AnimatedSprite2D").animation_finished
	CombatManager.player_turn("escape")
	update_display()

func _on_heal_button_pressed() -> void:
	print("Heal pressed")
	var player = get_tree().get_first_node_in_group("player")
	player.get_node("AnimatedSprite2D").play("healing")
	await player.get_node("AnimatedSprite2D").animation_finished
	CombatManager.player_turn("healing")
	update_display()
