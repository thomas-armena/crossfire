extends KinematicBody2D

export var speed = 10
export var direction = 0
export var damage = 20

func _ready():
	pass # Replace with function body.
	
func _physics_process(delta):
	var dir = PI
	var velocity = Vector2(cos(direction), sin(direction)) * speed
	var collision = move_and_collide(velocity)
	if collision: handle_collision(collision)
	
func handle_collision(collision):
	queue_free()
	
	collision.collider.entity.impulse_by_angle(direction,10000)
	collision.collider.entity.damage(20)

func _on_DeathTimer_timeout():
	queue_free()
