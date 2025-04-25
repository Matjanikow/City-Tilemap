extends Node

var cell:int = 16
const offsetGrid:Vector2 = Vector2(8,8)
@onready var tile_map: TileMap = get_parent().tile_map
@onready var parent = get_parent()

func mover(direccion: Vector2):
	#get_parent().position +=direccion * cell
	if Input.is_action_just_released("click"):
		move_to(parent.get_global_mouse_position())

func snap_to_grid():
	move_to(parent.global_position)

func move_to(target: Vector2):
	var index:Vector2i = tile_map.local_to_map(target)
	var indexPosition:Vector2 = Vector2(index.x, index.y)
	parent.position = indexPosition * cell + offsetGrid
