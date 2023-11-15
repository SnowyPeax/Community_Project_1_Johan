extends state


func _physics_process(delta):
	if player.dir:
		state_machine.change_to_state("Move")
	if Input.is_action_just_pressed("jump"):
		state_machine.change_to_state("Jump")
	if !player.is_on_floor():
		state_machine.change_to_state("Fall")


func on_state_entered():
	player.change_animation("idle")
