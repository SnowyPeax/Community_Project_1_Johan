extends enemy_state

var camera
var target

func on_state_entered():
	camera = player.get_node("Camera2D")
	target = camera.global_position - enemy.get_viewport_rect().size / 3
	print("ascending")

func _physics_process(delta):
	target = camera.global_position - enemy.get_viewport_rect().size / 3
	
	if enemy.global_position.distance_to(target) < 20:
		state_machine.change_to_state("Stalk")
	
	enemy.velocity += (target - enemy.global_position).normalized() * enemy.ascend_speed * delta
	enemy.move_and_slide()
