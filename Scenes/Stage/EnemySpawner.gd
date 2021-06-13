extends Node2D

export (NodePath) var player1_path
export (NodePath) var player2_path

onready var EnemyBasic = preload("res://Scenes/Enemies/EnemyBasic.tscn")
onready var EnemyChase = preload("res://Scenes/Enemies/EnemyChase.tscn")
onready var EnemyDash = preload("res://Scenes/Enemies/EnemyDash.tscn")


onready var spawn_points = get_child_count()

var rng = RandomNumberGenerator.new()

func _ready():
	var timer = Timer.new()
	add_child(timer)
	timer.connect("timeout", self, "on_timeout")
	timer.start(2)
	print(player1_path)

func choose_player():
	if (rng.randi()%2):
		return player1_path
	else:
		return player2_path

func on_timeout():
	var enemy_type = rng.randi()%3
	var enemy
	if(enemy_type == 0):
		enemy = EnemyBasic.instance()
	elif(enemy_type == 1):
		enemy = EnemyChase.instance()
		enemy.target_player_path = choose_player()
	else:
		enemy = EnemyDash.instance()
		enemy.target_player_path = choose_player()

	enemy.position = get_child(rng.randi()%spawn_points).position
	get_tree().get_current_scene().add_child(enemy)
	pass
