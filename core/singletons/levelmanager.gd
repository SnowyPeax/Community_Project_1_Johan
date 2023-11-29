extends Node

var home_scene : PackedScene = preload("res://core/scenes/test_scene.tscn")

var time_elapsed = 0

func _process(delta):
	time_elapsed += delta

func change_scene(scene : PackedScene):
	get_tree().change_scene_to_packed(scene)
	time_elapsed = 0

func display_default_end_screen():
	var end_screen = load("res://core/gui/default_end_screen.tscn").instantiate()
	get_tree().get_root().add_child(end_screen)
