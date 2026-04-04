extends Node
var stat_manager
var enemies = [Goblin, Orc, Fairy]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	stat_manager = get_node("../stats_manager")

func start_combat()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
