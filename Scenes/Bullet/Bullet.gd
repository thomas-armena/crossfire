extends KinematicBody2D

export var speed = 1000
export var direction = 0

func _ready():
	pass # Replace with function body.
	
func _physics_process(delta):
	var dir = PI
	var velocity = Vector2(cos(direction), sin(direction)) * speed
	move_and_slide(velocity)
	


func _on_DeathTimer_timeout():
	queue_free()
