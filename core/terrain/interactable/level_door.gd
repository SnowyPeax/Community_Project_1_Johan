extends Area2D


@export var level : PackedScene
@export var level_name : String


func _ready():
	$LevelNameLabel.hide()
	$LevelNameLabel.text = level_name
	set_process_input(false)

func _on_body_entered(body):
	if body.name == "Player":
		if $LevelNameLabel.text != "":
			set_process_input(true)
			$LevelNameLabel.show()


func _on_body_exited(body):
	if body.name == "Player":
		if $LevelNameLabel.text != "":
			set_process_input(false)
			$LevelNameLabel.hide()

func _input(event):
	if event.is_action("interact"):
		Levelmanager.change_scene(level)
