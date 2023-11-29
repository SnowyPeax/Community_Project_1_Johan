extends CanvasLayer



func _ready():
	$CenterContainer/VBoxContainer/LevelNameLabel.text = get_tree().current_scene.name
	$CenterContainer/VBoxContainer/TimeLabel.text = "in " + str(round(Levelmanager.time_elapsed)) + " seconds!"



func _on_button_pressed():
	get_tree().change_scene_to_file("res://core/scenes/lobby.tscn")
	queue_free()
