extends Node

# Event Manager handles events that occur during gameplay
# Events are randomly chosen with influence from stats
# Triggers Popups, handles user selection, calls StatsManager to update

var timer = 0.0
var events = ["event_request_color", 
			"event_request_money", 
			"event_found_potion",
			"event_found_coins"]

func _process(delta):
	# Every minute, there is a 30% chance of an event triggering
	if timer > 60:
		timer = 0.0
		if randf() < 0.3:
			select_event()
	timer += delta

func is_time_for_event():
	# your logic here
	return true or false
	
func select_event():
	# Based on probabilities, trigger an event
	events = [event_request_color]
	number = randf()
	if StatManager.health < 30 and number < 0.1:
		return true
	return true

func trigger_popup(message: String, choices: Array = []):
	get_tree().paused = true
	var popup = popup_scene.instantiate()
	popup.setup(message, choices)
	get_tree().root.add_child(popup)
# Based on stats, events have different
# Every minute, there

# Handle Choices from Event Popups (Updates StatsManager)
# TODO: Update with results of event choices
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

func event_found_potion():
	trigger_popup("Your Line found a health potion")
	#StatManager.health = 100

func event_found_coins():
	trigger_popup("Your Line found coins")
	#StatManager.coin += 50
	
func event_request_money():
	trigger_popup("Your Line asked for money", ["Give money", "Refuse"])

func event_request_color():
	trigger_popup("Your Line asked for a color change", ["Pay Up", "Refuse"])
	#StatManager.update_color()
	
func event_zero_affection():
	trigger_popup("Your Line has lost all affection for you and murdered you in your sleep :(")
	#StatManager.take_damage(100)

func event_total_obedience():
	trigger_popup("Your Line has been overly disiplined and goes through a rebellious phase")
	#StatManager.something happens
	
