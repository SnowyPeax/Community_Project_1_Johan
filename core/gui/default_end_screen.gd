extends CanvasLayer



func _ready():
	$CenterContainer/VBoxContainer/LevelNameLabel.text = get_tree().current_scene.name
	$CenterContainer/VBoxContainer/TimeLabel.text = "in " + str(Levelmanager.get_time_elapsed()) + " seconds!"


func _on_button_pressed():
	Levelmanager.go_to_lobby()
	queue_free()


func _on_button_2_pressed():
	Levelmanager.reload_scene()
	queue_free()
