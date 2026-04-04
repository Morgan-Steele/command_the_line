extends Node

# Event Manager handles events that occur during gameplay
# Events are randomly chosen with influence from stats
# Triggers Popups, handles user selection, calls StatsManager to update

var timer = 0.0
var popup_active = false
var events = ["event_request_color", 
			"event_request_money", 
			"event_found_potion",
			"event_found_coins"]
var popup_scene = preload("res://Levels/event_popup.tscn")

# Every minute, there is a 30% chance of an event triggering 
func _process(delta):
	if timer > 10 and not popup_active:
		print("10 seconds have passed")
		timer = 0.0
		if randf() < 0.7:
			print("Event Triggered")
			select_event()
		else:
			print("Event Not Triggered")
	elif popup_active:
		timer = 0
	timer += delta

# Randomly Selects an event to trigger
func select_event():
	# TODO: Change probabilities based on current stats
	var chosen = events[randi() % events.size()]
	print("The chosen event is:")
	print(chosen)
	call(chosen)

# Instantiate popup window
func trigger_popup(event: String, message: String, choices: Array = []):
	popup_active = true
	get_tree().paused = true
	var popup = popup_scene.instantiate()
	popup.setup(message, choices, event)
	get_tree().root.add_child(popup)

# Handle Choices from Event Popups (Updates StatsManager)
# TODO: Update with results of event choices and rest of possible events
func handle_choice(event: String, choice: int):
	match event:
		"event_request_color":
			if (choice == 0):
				#StatsManager.
				return true
			elif (choice == 1):
				return true
		"event_request_money":
			if (choice == 0):
				#StatsManager.
				return true
			elif (choice == 1):
				return true	
	return true

# Create Popup with specific options and label
# TODO: Update StatsManager with results

func event_found_potion():
	trigger_popup("event_found_potion", "Your Line found a health potion", [])
	#StatManager.health = 100

func event_found_coins():
	trigger_popup("event_found_coins", "Your Line found coins", [])
	#StatManager.coin += 50
	
func event_request_money():
	trigger_popup("event_request_money", "Your Line asked for money", ["Give money", "Refuse"])

func event_request_color():
	trigger_popup("event_request_color", "Your Line asked for a color change", ["Pay Up", "Refuse"])
	#StatManager.update_color()
	
func event_zero_affection():
	trigger_popup("event_zero_affection", "Your Line has lost all affection for you and murdered you in your sleep :(")
	#StatManager.take_damage(100)

func event_total_obedience():
	trigger_popup("event_total_obedience", "Your Line has been overly disiplined and goes through a rebellious phase")
	#StatManager.something happens
	
