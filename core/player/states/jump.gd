extends state


func on_state_entered():
	##change animation
	player.change_animation("jump")
	
	if player.is_on_floor() or player.is_on_wall():
		##emit particles
		if player.is_on_floor():
			$jumpParticles.global_position = player.feet.global_position
			$jumpParticles/jumpParticlesLeft.emitting = true
			$jumpParticles/jumpParticlesRight.emitting = true
		else:
			$jumpParticles.global_position = player.back.global_position
			$jumpParticles/jumpParticlesUp.emitting = true
			$jumpParticles/jumpParticlesDown.emitting = true
		
		##apply velocity
		player.velocity.y = 0
		if player.is_on_wall() and not player.is_on_floor():
			player.apply_force(Vector2(player.wall_jump_velocity.x * player.get_wall_normal().x, player.wall_jump_velocity.y))
		else:
			player.apply_force(Vector2(0, player.jump_velocity))


func _physics_process(delta):
	if player.velocity.y >= 0:
		state_machine.change_to_state("Fall")
	if player.is_on_wall():
		state_machine.change_to_state("Wallslide")
		
	if !Input.is_action_pressed("jump"):
		player.velocity.y += player.gravity * delta * 1.3
	
	if player.dir.x:
		player.flip_h(player.dir.x < 1)
	player.velocity.x += player.aerial_speed * player.dir.x * delta
