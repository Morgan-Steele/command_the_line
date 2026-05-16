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
	CombatManager.player_turn("attack")
	var player = get_tree().get_first_node_in_group("player")
	#player.get_node("AnimatedSprite2D").play("attack")
	player.get_node("AnimatedSprite2D").play(StatsManager.selected_ability)
	await player.get_node("AnimatedSprite2D").animation_finished
	update_display()
	print("Attack Finished")


func _on_escape_button_pressed() -> void:
	print("Escape pressed")
	CombatManager.player_turn("escape")
	var player = get_tree().get_first_node_in_group("player")
	#player.get_node("AnimatedSprite2D").play("escape")
	player.get_node("AnimatedSprite2D").play(StatsManager.selected_ability)
	await get_tree().create_timer(0.5).timeout
	await player.get_node("AnimatedSprite2D").animation_finished
	update_display()

func _on_heal_button_pressed() -> void:
	print("Heal pressed")
	CombatManager.player_turn("healing")
	var player = get_tree().get_first_node_in_group("player")
	#player.get_node("AnimatedSprite2D").play("healing")
	player.get_node("AnimatedSprite2D").play(StatsManager.selected_ability)
	await player.get_node("AnimatedSprite2D").animation_finished
	update_display()
