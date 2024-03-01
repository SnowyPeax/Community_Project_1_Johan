extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mouse_pos = get_viewport().get_mouse_position()
	
	var mouse_dir = global_position + mouse_pos - get_viewport_rect().size / 2
	
	if mouse_dir.x < 0:
		scale.x = -1
		position.x = -8
	else:
		scale.x = 1
		position.x = 8
	
	if Input.is_action_just_pressed("left_mouse"):
		$AnimationPlayer.play("swing")
