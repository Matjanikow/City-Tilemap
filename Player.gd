extends CharacterBody2D

@onready var planeAsset: Sprite2D = $Plane
@onready var celda: Node = $celda
@onready var mruv: Node = $mruv
@onready var states: Dictionary = {"mruv": mruv, "celda": celda}
@onready var state = states.get("mruv")

func _physics_process(delta):
	if Input.is_action_just_pressed("celda"):
		state = states.get("celda")
	if Input.is_action_just_pressed("mruv"):
		state = states.get("mruv")
	var direccion = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	state.mover(direccion)
	planeAsset.look_at(position + direccion)
	move_and_slide()
