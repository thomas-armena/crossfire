extends KinematicBody2D

export (NodePath) var target_player_path;

onready var entity = get_node("Entity")
onready var target_player = get_node(target_player_path)
onready var type = "enemy"

export (float) var speed = 30000 
export (float) var dash_time = 2

var dash_timer = Timer.new()

func _ready():
	add_child(dash_timer)
	dash_timer.connect("timeout", self, "_on_dash_timeout")
	dash_timer.start(dash_time)
	
func _physics_process(delta):
	target_player = get_node(target_player_path)
	if (!target_player):
		return
	look_at(target_player.position)

func _on_dash_timeout():
	target_player = get_node(target_player_path)
	if (!target_player):
		return
	entity.impulse(target_player.position, speed)
	
func move(velocity):
	move_and_collide(velocity)
