extends KinematicBody2D

export var color = Color(1, 0, 0)
export var move_right_action := "p1_move_right"
export var move_left_action := "p1_move_left"
export var move_down_action := "p1_move_down"
export var move_up_action := "p1_move_up"
export var shoot_action := "p1_shoot"
export (NodePath) var target_player_path

var speed = 500
var velocity = Vector2()
var BULLET = preload("res://Scenes/Bullet/Bullet.tscn")
var target_player

onready var entity = get_node("Entity")

func _ready():
	var circle = get_node("Circle")
	circle.color = color
	target_player = get_node(target_player_path)

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed(move_right_action):	velocity.x += 1
	if Input.is_action_pressed(move_left_action): 	velocity.x -= 1
	if Input.is_action_pressed(move_down_action): 	velocity.y += 1
	if Input.is_action_pressed(move_up_action):		velocity.y -= 1
	velocity = velocity.normalized()

func _physics_process(delta):
	get_input()
	entity.impulse(velocity+position, speed)
	
func _process(delta):
	if Input.is_action_just_pressed(shoot_action):
		shoot()
		
func shoot():
	var bullet = BULLET.instance()
	bullet.direction = PI+(global_position - target_player.global_position).angle()
	print(bullet.direction)
	bullet.position = position
	get_tree().get_root().add_child(bullet)
