extends Node

var home_scene : PackedScene = preload("res://core/scenes/lobby.tscn")

var pause_scene = preload("res://core/gui/pause_screen.tscn")
var is_paused = false

var overlay = preload("res://core/gui/overlay.tscn")

var time_elapsed = 0
var is_timing = false

var _player = null
var _checkpoint_pos = null
var _checkpoint = null

func _ready():
	get_tree().get_root().add_child.call_deferred(overlay.instantiate())

func _process(delta):
	if is_timing:
		time_elapsed += delta

func get_player():
	return _player

func get_checkpoint_position():
	return _checkpoint_pos

func get_checkpoint():
	return _checkpoint

func _reset_checkpoint():
	_checkpoint_pos = null
	_checkpoint = null

func change_scene(scene : PackedScene):
	get_tree().change_scene_to_packed(scene)
	_reset_checkpoint()

func go_to_lobby():
	get_tree().change_scene_to_packed(home_scene)
	_reset_checkpoint()

func reload_from_checkpoint():
	get_tree().reload_current_scene()

func reload_scene():
	_reset_checkpoint()
	get_tree().reload_current_scene()
	time_elapsed = 0

func display_default_end_screen():
	var end_screen = load("res://core/gui/default_end_screen.tscn").instantiate()
	get_tree().get_root().add_child(end_screen)

func _input(event):
	if event.is_action_pressed("pause"):
		if !is_paused:
			get_tree().get_root().add_child(pause_scene.instantiate())
			is_paused = true
		else:
			is_paused = false

func get_time_elapsed():
	return round(time_elapsed * 100) / 100

func start_time():
	is_timing = true
	time_elapsed = 0

func stop_time():
	is_timing = false
