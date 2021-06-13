extends KinematicBody2D

onready var entity = get_node("Entity")
onready var view_width = get_viewport_rect().size.x
onready var view_height = get_viewport_rect().size.y

var rng = RandomNumberGenerator.new()
var target = Vector2()
export (float) var speed = 300 

func _ready():
	rng.randomize()
	target = Vector2(rng.randf_range(0, view_width), rng.randf_range(0, view_height))

func update_behaviour(delta):
	var distance = target.distance_to(position)

	if (abs(distance) < 32):
		target = Vector2(rng.randf_range(0, view_width), rng.randf_range(0, view_height))
		
	entity.impulse(target, speed)
	
func move(velocity):
	move_and_collide(velocity)

func _physics_process(delta):
	update_behaviour(delta)

