extends KinematicBody2D


export (NodePath) var target_player;

onready var entity = get_node("Entity")
onready var target = get_node(target_player)
onready var type = "enemy"

export (float) var speed = 30000 
export (float) var dash_time = 2

var dash_timer = Timer.new()

func _ready():
	add_child(dash_timer)
	dash_timer.connect("timeout", self, "_on_dash_timeout")
	dash_timer.start(dash_time)
	
func _physics_process(delta):
	if (!target):
		return
	look_at(target.position)

func _on_dash_timeout():
	if (!target):
		return
	entity.impulse(target.position, speed)
	
func move(velocity):
	move_and_collide(velocity)
