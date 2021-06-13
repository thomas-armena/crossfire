extends Node2D

export (float) var hp = 50
export (float) var dmg = 1

var acceleration = Vector2()
var velocity = Vector2()

export (Vector2) var damping = Vector2(0.8, 0.8)
export (Vector2) var friction = Vector2(0.8, 0.8)

func impulse(target_pos, strength):
	var direction = target_pos - get_parent().position
	acceleration += direction.normalized() * strength

func _physics_process(delta):
	velocity += acceleration * delta
	get_parent().position += velocity * delta
	get_parent().rotation = velocity.angle()
	
	acceleration *= damping
	velocity *= friction
