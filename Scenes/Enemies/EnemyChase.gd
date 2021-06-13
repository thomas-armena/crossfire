extends KinematicBody2D

onready var entity = get_node("Entity")
onready var view_width = get_viewport_rect().size.x
onready var view_height = get_viewport_rect().size.y

var target = Vector2()
export (float) var speed = 30000 

var dash_timer = Timer.new()

func _ready():
	dash_timer.connect("timeout", self, "_on_dash_timeout")
	add_child(dash_timer)
	dash_timer.start(1)
	

func update_behaviour(delta):
	var distance = target.distance_to(position)
	

func _physics_process(delta):
	look_at(get_global_mouse_position())
	update_behaviour(delta)

func _on_dash_timeout():
	print("DASH")
	entity.impulse(get_global_mouse_position(), speed)
