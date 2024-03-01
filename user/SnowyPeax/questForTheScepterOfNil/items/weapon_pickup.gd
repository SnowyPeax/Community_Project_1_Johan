extends Area2D

@onready var player

@export var weapon : PackedScene
@export var sprite : Texture


# Called when the node enters the scene tree for the first time.
func _ready():
	player = Levelmanager.get_player()
	$Sprite2D.texture = sprite

func _on_body_entered(body):
	if body == player:
		var weapon_instance = weapon.instantiate()
		weapon_instance.position += Vector2(0, 4)
		player.add_child(weapon_instance)
		queue_free()
