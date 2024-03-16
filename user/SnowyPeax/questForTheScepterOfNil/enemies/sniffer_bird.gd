extends CharacterBody2D

@export var health = 10
@export var chase_speed = 100
@export var ascend_speed = 100
@export var friction = 1

var player


func _ready():
	player = Levelmanager.get_player()
	$AnimationPlayer.play("fly")

func _physics_process(delta):
	velocity *= 1 - (friction * delta)
	
	move_and_slide()


func take_damage(damage):
	health -= damage
	
	if health <= 0:
		queue_free()


func _on_area_2d_body_entered(body):
	if body == player:
		player.die()

