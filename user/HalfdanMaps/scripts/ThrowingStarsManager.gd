extends Node2D

@export var throwing_star : PackedScene

@onready var player = get_parent()

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
	if player.dir != Vector2.ZERO:
		t.direction = player.dir
	else:
		t.direction = Vector2.RIGHT * player.get_node("AnimatedSprite2D").scale.x
	get_tree().root.add_child(t)
