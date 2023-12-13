extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$CenterContainer/VBoxContainer/LevelNameLabel.text = get_tree().current_scene.name
	$CenterContainer/VBoxContainer/Button2.grab_focus()
	get_tree().paused = true



func _on_button_pressed():
	Levelmanager.go_to_lobby()
	get_tree().paused = false
	queue_free()


func _on_button_2_pressed():
	Levelmanager.reload_scene()
	get_tree().paused = false
	queue_free()

func _input(event):
	if event.is_action_pressed("pause") and Levelmanager.is_paused:
		get_tree().paused = false
		queue_free()
