extends Node2D

onready var iris = get_node("Iris")
export var target_look_direction = 0
var look_direction = 0

func _process(delta):
	look_direction = target_look_direction
	rotation = target_look_direction
