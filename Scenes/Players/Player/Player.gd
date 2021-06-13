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

var face_sway_counter = 0

onready var entity = get_node("Entity")
onready var face = get_node("Face")
onready var left_eye = get_node("Face/LeftEye")
onready var right_eye = get_node("Face/RightEye")
onready var target_player = get_node(target_player_path)

func _ready():
	var circle = get_node("Circle")
	circle.color = color
	
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
	sway_face()
	set_look_direction()
	if Input.is_action_just_pressed(shoot_action):
		shoot()
		
func sway_face():
	face_sway_counter += entity.velocity.length()/1000
	face.rotation = cos(face_sway_counter)/5
	
func set_look_direction():
	if target_player == null: return
	var vector = (target_player.global_position - global_position).normalized()
	left_eye.target_look_direction = vector.angle()
	right_eye.target_look_direction = vector.angle()
		
func shoot():
	if target_player == null: return 
	var bullet = BULLET.instance()
	var vector = (target_player.global_position - global_position).normalized()
	bullet.direction = vector.angle()

	bullet.position = position + vector*(32 + 16)
	get_tree().get_root().add_child(bullet)
	entity.impulse(position-vector, 5000)
