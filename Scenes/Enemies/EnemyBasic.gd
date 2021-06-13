extends KinematicBody2D

onready var entity = get_node("Entity")

enum EnemyState {
	CHASE,
	EVADE,
}

var velocity = Vector2()
var state = EnemyState.CHASE


# Called when the node enters the scene tree for the first time.
func _ready():
	print(entity.hp)

	
func update_behaviour(delta):
	var target_pos = get_global_mouse_position()
	var distance = target_pos.distance_to(position)
	
	if (distance < 32):
		state = EnemyState.EVADE
	
	if (distance > 200):
		state = EnemyState.CHASE
	
	if (state == EnemyState.CHASE):
		look_at(get_global_mouse_position())
	else:
		look_at(-get_global_mouse_position())
		
	
func update_movement(delta):
	velocity = Vector2(entity.movement_speed, 0).rotated(rotation)
	velocity = move_and_slide(velocity * delta)


func _physics_process(delta):
	update_behaviour(delta)
	update_movement(delta)
	
