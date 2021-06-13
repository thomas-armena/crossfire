extends KinematicBody2D

export (NodePath) var target_player_path;
export (float) var speed = 300

onready var entity = get_node("Entity")
onready var target_player = get_node(target_player_path)
onready var target = Vector2()
onready var type = "enemy"

func move(velocity):
	move_and_collide(velocity)

func update_behaviour(delta):
	var distance = target.distance_to(position)
		
	entity.impulse(target, speed)

func _physics_process(delta):
	target_player = get_node(target_player_path)
	target = target_player.position
	look_at(target)
	update_behaviour(delta)
