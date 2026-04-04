extends Area2D

var popup_scene = preload("res://canvas_layer.tscn")

func _on_body_entered(body):
	get_tree().paused = true
	var popup = popup_scene.instantiate()
	get_tree().root.add_child(popup)
