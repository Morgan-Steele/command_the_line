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
var good_events = ["event_found_potion","event_found_coins","event_happy"]
var nuetral_events = ["event_request_color","event_request_money"]
var bad_events = ["event_trip","event_depression"]
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
	#based on affection
	var chooser = randi_range(1,180)
	var chosen
	while (true):
		if(chooser<(60-(StatsManager.affection-50))):
			chosen = events[randi() % bad_events.size()]
			break
		if(chooser<((60-(StatsManager.affection-50)))+60):
			chosen = events[randi() % nuetral_events.size()]
			break
		chosen = events[randi() % good_events.size()]
		break
	
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
	StatsManager.requests+=1
	match event:
		"event_request_color":
			if (StatsManager.coins<20):
				choice=0
			if (choice == 0):#no
				StatsManager.denied+=1
				StatsManager.affection-=10
				if(StatsManager.denied/StatsManager.requests < .5):
					StatsManager.obedience+=10
				return true
			elif (choice == 1):#yes
				StatsManager.coins-=20
				StatsManager.color=StatsManager.requested_color
				StatsManager.affection+=10
				if(StatsManager.denied/StatsManager.requests < .5):
					StatsManager.obedience-=10
				return true
		"event_request_money":
			if (choice == 0):
				StatsManager.denied+=1
				StatsManager.affection-=10
				return true
			elif (choice == 1):
				StatsManager.coins-=StatsManager.requested_coins
				StatsManager.affection+=10
				if(StatsManager.denied/StatsManager.requests < .5):
					StatsManager.obedience-=10
				return true	
	return true

# Create Popup with specific options and label
# TODO: Update StatsManager with results
#to implement: trip, depression, happy

func event_depression():
	var random
	for i in StatsManager.abilities:
		random=randi_range(0,20)
		i.skill-=random
		if(i.skill<0):
			i.skill=0
	trigger_popup("event_depression", "Your Line has been feeling a little off recently", [])
	
func event_happy():
	var random
	for i in StatsManager.abilities:
		random=randi_range(0,20)
		i.skill+=random
		if(i.skill>100):
			i.skill=100
	trigger_popup("event_happy", "Your Line feels on top of the world", [])

func event_trip():
	var health = randi_range(1,10)
	StatsManager.health-=health
	if (StatsManager.health<0):
		StatsManager.health=0
	trigger_popup("event_trip", "-"+str(health)+" Ouch, that hurt! You've been stumbling over your line a lot recently and you're starting to get suspcious.", [])

func event_found_potion():
	trigger_popup("event_found_potion", "Your Line found a health potion", [])
	StatsManager.health+=randi_range(5,55)
	if StatsManager.health>100:
		StatsManager.health=100

func event_found_coins():
	var num_coins=randi_range(1,20)
	trigger_popup("event_found_coins", "Your Line found "+str(num_coins)+" coins", [])
	StatsManager.coins+=num_coins
	
func event_request_money():
	StatsManager.requested_coins=randi_range(1,StatsManager.coins)	
	trigger_popup("event_request_money", "Your Line asked for " +str(StatsManager.requested_coins)+" money", ["Give money", "Refuse"])

func event_request_color():
	StatsManager.requested_color = randi_range(0,3)
	if(StatsManager.requested_color==StatsManager.colour):
		StatsManager.requested_color=(StatsManager.requested_color+1)%4
	trigger_popup("event_request_color", "Your Line wants to be "+StatsManager.Colour.find_key(StatsManager.requested_color)+". This dye job will cost 20 coins.", ["Pay Up", "Refuse"])
	
func event_zero_affection():
	trigger_popup("event_zero_affection", "Your Line has lost all affection for you and murdered you in your sleep :(")
	StatsManager.health=0

func event_total_obedience():
	trigger_popup("event_total_obedience", "Your Line has been overly disiplined and goes through a rebellious phase")
	StatsManager.obedience=20
