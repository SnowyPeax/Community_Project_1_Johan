extends Area2D

@export var right_way = true

var player
var can_rotate_player = true

@onready var timer = Timer.new()

func _ready():
	player = Levelmanager.get_player()
	
	add_child(timer)
	timer.wait_time = 0.5
	timer.one_shot = true
	timer.connect("timeout", _on_Timer_timeout)

func _process(delta):
	if can_rotate_player:
		if right_way:
			rotate(delta * 2)
		else:
			rotate(-delta * 2)

func _on_rotator_body_entered(body):
	if body == player and can_rotate_player:
		player.rotate_gravity(right_way)
		can_rotate_player = false 
		timer.start() 
		
func _on_Timer_timeout():
	can_rotate_player = true 
