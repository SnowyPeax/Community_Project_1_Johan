extends Node2D

@export var throwing_star : PackedScene
@export var counter : Label

@onready var player = get_parent()

var stars_left = 100

func _ready():
	counter.text = ": " + str(stars_left)

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_K:
			throw()

func throw():
	if stars_left <= 0: return
	stars_left -= 1
	counter.text = ": " + str(stars_left)
	var t = throwing_star.instantiate()
	if player.dir != Vector2.ZERO:
		t.direction = player.dir
	else:
		t.direction = Vector2.RIGHT * player.get_node("AnimatedSprite2D").scale.x
	t.global_position = global_position
	t.friendly = true
	get_tree().root.add_child(t)

func add_throwing_star():
	stars_left += 1
	counter.text = ": " + str(stars_left)
