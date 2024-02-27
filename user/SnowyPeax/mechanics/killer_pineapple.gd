extends CharacterBody2D

@export var speed = 200


var player

func _ready():
	player = Levelmanager.get_player()
	editor_description = "basketable"

func _physics_process(delta):
	if player == null:
		player = Levelmanager.get_player()
	else:
		var direction = player.position - position
		
		velocity = direction.normalized() * speed
		
		if move_and_slide():
			velocity = get_real_velocity().normalized() * velocity.length()


func collect():
	queue_free()


func _on_area_2d_body_entered(body):
	if body == player:
		player.die()
