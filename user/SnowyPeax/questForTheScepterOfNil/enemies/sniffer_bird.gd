extends CharacterBody2D

@export var health = 10

var player

func _ready():
	player = Levelmanager.get_player()
	$AnimationPlayer.play("fly")

func _physics_process(delta):
	pass

func take_damage(damage):
	health -= damage
	
	if health <= 0:
		queue_free()


func _on_area_2d_body_entered(body):
	if body == player:
		player.die()
