extends enemy_state

func _physics_process(delta):
	var dir = player.global_position - enemy.global_position
	
	enemy.velocity = dir.normalized() * enemy.chase_speed
