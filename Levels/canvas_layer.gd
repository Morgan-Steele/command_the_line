extends CanvasLayer

var current_event = ""

func setup(message: String, choices: Array, event):
	current_event = event
	$Label.text = message
	if choices.is_empty():
		$CloseButton.visible = true 
	else:
		$CloseButton.visible = false
		$Choice1Button.text = choices[0]
		$Choice2Button.text = choices[1]
		$Choice1Button.visible = true
		$Choice2Button.visible = true

func _on_choice_1_button_pressed():
	get_tree().paused = false
	EventManager.handle_choice(current_event, 0)
	queue_free()

func _on_choice_2_button_pressed():
	get_tree().paused = false
	EventManager.handle_choice(current_event, 1)
	queue_free()
	
func _on_close_button_pressed():
	get_tree().paused = false
	queue_free()
	
