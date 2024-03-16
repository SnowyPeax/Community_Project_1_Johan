extends Node

var screenToggle_timer = 0.0
var screenToggle_duration = 0.1



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if screenToggle_timer >= 0:
		screenToggle_timer -= delta
	else:
		set_process(false)


func _unhandled_input(event):
	if event.is_action_pressed("custom_toggle_fullscreen") and DisplayServer.window_get_mode() == 3 and screenToggle_timer <= 0:	# Check if the key for toggling fullscreen/windowed is pressed
		DisplayServer.window_set_mode(0)
		screenToggle_timer = screenToggle_duration
		set_process(true)
	if event.is_action_pressed("custom_toggle_fullscreen") and DisplayServer.window_get_mode() == 0 and screenToggle_timer <= 0:	# Check if the key for toggling fullscreen/windowed is pressed
		DisplayServer.window_set_mode(3)
		screenToggle_timer = screenToggle_duration
		set_process(true)
