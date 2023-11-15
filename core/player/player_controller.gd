extends CharacterBody2D

class_name player

@export var speed = 2000.0
@export var aerial_speed = 1700
@export var max_wallslide_speed = 200
@export var jump_velocity = -400.0
@export var wall_jump_velocity = Vector2(400, -300)
@export var friction = 10

@onready var feet = $Feet
@export var back : Marker2D
var dir = Vector2.ZERO

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var states = $StateMachine
@onready var animations = $AnimatedSprite2D


func apply_force(force : Vector2):
	velocity += force

func _physics_process(delta):
	apply_physics(delta)
	move_and_slide()

func apply_physics(delta):
	#Apply Friction
	velocity.x *= 1 - (friction * delta)
	
	#Apply Gravity
	velocity.y += gravity * delta

func _input(event):
	dir = Input.get_vector("left", "right", "up", "down")

func change_animation(animation_name : String):
	if animations != null:
		animations.play(animation_name)

func flip_h(_d):
	$AnimatedSprite2D.scale.x = -1 if _d else 1
