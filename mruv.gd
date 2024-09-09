extends Node

@export var speed = 200
@export var friction = 0.01
@export var acceleration = 0.01
@onready var parent: CharacterBody2D = get_parent()
func mover(direccion: Vector2):
	#Pregunto si estoy señalando
	if direccion.length() > 0:
		parent.velocity = parent.velocity.lerp(direccion*speed, acceleration)
	else:
		parent.velocity = parent.velocity.lerp(Vector2.ZERO, friction)
