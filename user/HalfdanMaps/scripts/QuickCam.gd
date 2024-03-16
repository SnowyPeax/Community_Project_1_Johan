extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Levelmanager.get_player().get_node("Camera2D").enabled = false
	
