extends CanvasLayer


func _process(delta):
	if Levelmanager.time_elapsed > 0:
		$Label.text = str(Levelmanager.get_time_elapsed())
	else:
		$Label.text = ""
