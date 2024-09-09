extends Node

var cell = 4

func mover(direccion: Vector2):
	get_parent().position +=direccion * cell
