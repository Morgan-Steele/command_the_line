extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel/BoxContainer2/BoxContainer/Label.text="Sword ("+StatsManager.like_string[StatsManager.abilities[0].like]+")"
	$Panel/BoxContainer2/BoxContainer2/Label.text="Shield ("+StatsManager.like_string[StatsManager.abilities[1].like]+")"
	$Panel/BoxContainer2/BoxContainer3/Label.text="Helicopter ("+StatsManager.like_string[StatsManager.abilities[2].like]+")"
	$Panel/BoxContainer2/BoxContainer4/Label.text="Magic Staff ("+StatsManager.like_string[StatsManager.abilities[3].like]+")"
	$Panel/BoxContainer2/BoxContainer5/Label.text="Walking Stick ("+StatsManager.like_string[StatsManager.abilities[4].like]+")"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$BoxContainer/Label.text = "Coins: "+str(StatsManager.coins)
	$BoxContainer/ProgressBar.value=StatsManager.affection
	$BoxContainer/ProgressBar2.value=StatsManager.obedience

	$Panel/BoxContainer2/BoxContainer/ProgressBar.value=StatsManager.abilities[0].skill
	$Panel/BoxContainer2/BoxContainer/ProgressBar2.value=StatsManager.abilities[0].aptitude
	
	$Panel/BoxContainer2/BoxContainer2/ProgressBar.value=StatsManager.abilities[1].skill
	$Panel/BoxContainer2/BoxContainer2/ProgressBar2.value=StatsManager.abilities[1].aptitude
	
	$Panel/BoxContainer2/BoxContainer3/ProgressBar.value=StatsManager.abilities[2].skill
	$Panel/BoxContainer2/BoxContainer3/ProgressBar2.value=StatsManager.abilities[2].aptitude
	
	$Panel/BoxContainer2/BoxContainer4/ProgressBar.value=StatsManager.abilities[3].skill
	$Panel/BoxContainer2/BoxContainer4/ProgressBar2.value=StatsManager.abilities[3].aptitude
	
	$Panel/BoxContainer2/BoxContainer4/ProgressBar.value=StatsManager.abilities[4].skill
	$Panel/BoxContainer2/BoxContainer4/ProgressBar2.value=StatsManager.abilities[4].aptitude
	
