extends Node2D


@export var throwing_star : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_K:
			throw()

func throw():
	var t = throwing_star.instantiate()
	t.global_position = global_position
	get_tree().root.add_child(t)
