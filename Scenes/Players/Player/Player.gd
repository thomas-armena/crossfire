extends KinematicBody2D

export var color = Color(1, 0, 0)
export var move_right_action := "p1_move_right"
export var move_left_action := "p1_move_left"
export var move_down_action := "p1_move_down"
export var move_up_action := "p1_move_up"
export var shoot_action := "p1_shoot"
export (NodePath) var target_player_path

var speed = 500
var BULLET = preload("res://Scenes/Bullet/Bullet.tscn")
var target_player

onready var entity = get_node("Entity")

func _ready():
	var circle = get_node("Circle")
	circle.color = color
	target_player = get_node(target_player_path)
	
func _physics_process(delta):
	move()
	
func move():
	var move_vector = Vector2()
	if Input.is_action_pressed(move_right_action):	move_vector.x += 1
	if Input.is_action_pressed(move_left_action): 	move_vector.x -= 1
	if Input.is_action_pressed(move_down_action): 	move_vector.y += 1
	if Input.is_action_pressed(move_up_action):		move_vector.y -= 1
	move_vector = move_vector.normalized()
	entity.impulse(move_vector+position, speed)

func _process(delta):
	if Input.is_action_just_pressed(shoot_action):
		shoot()
		
func shoot():
	var bullet = BULLET.instance()
	var vector = (global_position - target_player.global_position).normalized()
	bullet.direction = PI+vector.angle()
	entity.impulse(vector+position, 5000)

	bullet.position = position
	get_tree().get_root().add_child(bullet)
