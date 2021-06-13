extends Node2D

onready var game_state = get_node("/root/GameState")
onready var score_label = get_node("ScoreLabel")
onready var health_label = get_node("HealthLabel")

func _process(delta):
	score_label.text = "Score: " + String(game_state.score)
	health_label.text = "Health: " + String(game_state.health)
