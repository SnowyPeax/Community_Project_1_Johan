extends Node2D

@export var projectile : PackedScene

var draw_depth = 200
var min_draw_depth = 200
var max_draw_depth = 450
var arrow = null


func _physics_process(delta):
	var mouse_pos = get_viewport().get_mouse_position()
	
	var mouse_dir = global_position + mouse_pos - get_viewport_rect().size / 2
	
	look_at(mouse_dir)
	
	if Input.is_action_pressed("left_mouse"):
		if arrow == null:
			arrow = projectile.instantiate()
		if draw_depth < max_draw_depth:
			draw_depth += 10
			modulate = Color(1 + (draw_depth - min_draw_depth) / 100, 1, 1, 1)
	
	if Input.is_action_just_released("left_mouse"):
		if arrow != null: #necessary to prevent crashes when using the pause menu
			arrow.global_position = global_position
			arrow.velocity = (mouse_dir - global_position).normalized() * draw_depth
			get_tree().get_root().add_child(arrow)
			draw_depth = min_draw_depth
			arrow = null
			modulate = Color(1, 1, 1, 1)
