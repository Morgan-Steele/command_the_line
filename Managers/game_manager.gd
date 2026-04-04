extends Node


func _process(delta):
	if my_algorithm_says_trigger():
		trigger_popup("Something happened!")

func my_algorithm_says_trigger():
	# your logic here
	return true or false
