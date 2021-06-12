extends KinematicBody2D

export var color = Color(1, 0, 0)
export var move_right_action := "p1_move_right"
export var move_left_action := "p1_move_left"
export var move_down_action := "p1_move_down"
export var move_up_action := "p1_move_up"

var speed = 250
var velocity = Vector2()


func _ready():
	var circle = get_node("Circle")
	circle.color = color

func get_input():
	# Detect up/down/left/right keystate and only move when pressed.
	velocity = Vector2()
	if Input.is_action_pressed(move_right_action): 	velocity.x += 1
	if Input.is_action_pressed(move_left_action): 	velocity.x -= 1
	if Input.is_action_pressed(move_down_action): 	velocity.y += 1
	if Input.is_action_pressed(move_up_action):		velocity.y -= 1
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	move_and_collide(velocity * delta)
