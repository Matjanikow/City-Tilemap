extends CharacterBody2D

@export var speed = 200
@export var friction = 0.01
@export var acceleration = 0.1
@export var planeAsset :Sprite2D  
##GODOT 3 TO 4 MIGRATION CHANGES EXPLAINED:
 #In GD4, there's a new variable called velocity in every CharacterBody2D node...
 #So instead of defining my own new velocity variable, I simply modify that one.
 #The move_and_slide function doesn't take a parameter in GD4,
 #it now works hand in hand with that velocity variable.
func _physics_process(delta):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if direction.length() > 0:
		velocity = velocity.lerp(direction.normalized() * speed, acceleration)
	else:
		velocity = velocity.lerp(Vector2.ZERO, friction)
	planeAsset.look_at((position + direction.normalized()))
	move_and_slide()

