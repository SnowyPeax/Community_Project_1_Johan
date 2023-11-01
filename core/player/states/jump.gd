extends state


func on_state_entered():
	player.apply_force(Vector2(0, player.jump_velocity))
	player.change_animation("jump")

func _physics_process(delta):
	if player.velocity.y >= 0:
		state_machine.change_to_state("Fall")
		
	
	if player.dir:
		player.animations.flip_h = player.dir.x != 1
	player.velocity.x += player.aerial_speed * player.dir.x * delta
