extends KinematicBody2D
onready var entity = get_node("Entity")
func _ready():
	pass 

func move(velocity):
	pass
	
func _physics_process(delta):
	var collision = move_and_collide(Vector2(0,0))
	if collision:
		var direction = collision.normal
		collision.collider.entity.impulse_by_angle(direction.angle(), -3000)
