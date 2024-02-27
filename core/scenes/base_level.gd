extends Node2D

class_name BaseLevel

func _ready():
	Levelmanager.start_time()
	if Levelmanager.get_checkpoint_position() != null:
		Levelmanager.get_player().global_position = Levelmanager.get_checkpoint_position()
