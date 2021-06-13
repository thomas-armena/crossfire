extends Node2D

onready var game_state = get_node("/root/GameState")

func _ready():
	pass 

func _process(delta):
	if Input.is_key_pressed(KEY_ENTER):
		game_state.score = 0
		game_state.health = 100
		get_tree().change_scene("res://Scenes/Stage/Stage2.tscn")


