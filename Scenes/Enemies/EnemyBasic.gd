extends KinematicBody2D

onready var entity = get_node("Entity")

enum EnemyState {
	CHASE,
	EVADE,
}
var state = EnemyState.CHASE

var acceleration = Vector2(0, 9)
var velocity = Vector2(2, 0)

var damping = Vector2(0.8, 0.8)
var friction = Vector2(0.8, 0.8)

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
	pass
	
func impulse(target_pos, strength):
	var direction = target_pos - position
	print(direction.normalized())
	acceleration += direction.normalized() * strength
	
	
func _input(event):
	if (event.is_pressed() and event.button_index == BUTTON_LEFT):
		impulse(get_global_mouse_position(), 10000)
		
func _physics_process(delta):
	look_at(get_global_mouse_position())
	
	# Update speed and position
	velocity += acceleration * delta
	position += velocity * delta
	
	# Apply friction and damping
	acceleration *= damping
	velocity *= friction
