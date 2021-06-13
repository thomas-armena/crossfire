extends KinematicBody2D

onready var entity = get_node("Entity")
onready var map_width = 1500
onready var map_height = 800
onready var type = "enemy"

var rng = RandomNumberGenerator.new()
var target = Vector2()
export (float) var speed = 300 

func _ready():
	rng.randomize()
	target = Vector2(rng.randf_range(0, map_width), rng.randf_range(0, map_height))

func update_behaviour(delta):
	var distance = target.distance_to(position)

	if (abs(distance) < 32):
		target = Vector2(rng.randf_range(0, map_width), rng.randf_range(0, map_height))
		
	entity.impulse(target, speed)
	
func move(velocity):
	move_and_collide(velocity)

func _physics_process(delta):
	update_behaviour(delta)

