extends CanvasLayer

var current_event = ""

func setup(message: String, choices: Array, event: String):
	current_event = event
	$Panel/VBoxContainer/Label.text = message
	if choices.is_empty():
		$Panel/VBoxContainer/CloseButton.visible = true 
		$Panel/VBoxContainer/CloseButton.text = "Close"
		$Panel/VBoxContainer/Choice1Button.visible = false
		$Panel/VBoxContainer/Choice2Button.visible = false
	else:
		$Panel/VBoxContainer/CloseButton.visible = false
		$Panel/VBoxContainer/Choice1Button.text = choices[0]
		$Panel/VBoxContainer/Choice2Button.text = choices[1]
		$Panel/VBoxContainer/Choice1Button.visible = true
		$Panel/VBoxContainer/Choice2Button.visible = true

func _on_choice_1_button_pressed():
	get_tree().paused = false
	EventManager.handle_choice(current_event, 0)
	queue_free()
	EventManager.popup_active = false

func _on_choice_2_button_pressed():
	get_tree().paused = false
	EventManager.handle_choice(current_event, 1)
	queue_free()
	EventManager.popup_active = false
	
func _on_close_button_pressed():
	get_tree().paused = false
	queue_free()
	EventManager.popup_active = false
	
