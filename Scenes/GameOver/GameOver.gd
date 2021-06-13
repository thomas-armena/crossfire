extends Node2D

onready var game_state = get_node("/root/GameState")
onready var score_label = get_node("CanvasLayer/ScoreLabel")

func _ready():
	score_label.text = "Score: " + String(game_state.score)

func _process(delta):
	if Input.is_key_pressed(KEY_ENTER):
		game_state.score = 0
		game_state.health = 100
		get_tree().change_scene("res://Scenes/Stage/Stage2.tscn")
