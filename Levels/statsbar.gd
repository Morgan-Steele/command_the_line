extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Panel/BoxContainer/Label.text = "Coins: "+str(StatsManager.coins)
	$Panel/BoxContainer/ProgressBar.value=StatsManager.affection
	$Panel/BoxContainer/ProgressBar2.value=StatsManager.obedience
