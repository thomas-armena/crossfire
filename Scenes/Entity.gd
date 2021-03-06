extends Node2D

onready var game_state = get_node("/root/GameState")

onready var BULLET_IMPACT = preload("res://Scenes/Bullet/Impact/Impact.tscn")

export (bool) var auto_rotate = true
export (bool) var wall = false

enum TYPE { player, enemy, wall }
export (TYPE) var type = TYPE.enemy

export (float) var hp = 50
export (float) var dmg = 1

var acceleration = Vector2()
var velocity = Vector2()

export (Vector2) var damping = Vector2(0.8, 0.8)
export (Vector2) var friction = Vector2(0.8, 0.8)

func impulse(target_pos, strength):
	if wall: return
	var direction = target_pos - get_parent().position
	acceleration += direction.normalized() * strength
	
func impulse_by_angle(angle, strength):
	if wall: return
	var direction = Vector2(cos(angle), sin(angle))
	acceleration += direction.normalized() * strength
	
func damage(amount):
	if wall: return
	
	var parent = get_parent()
	if parent.has_method("handle_damage"):
		parent.handle_damage(amount)
		return 
	hp = max(0, hp-amount)

func _physics_process(delta):
	if wall: return
	velocity += acceleration * delta
	var collision = get_parent().move_and_collide(velocity * delta)
	if collision && get_parent().has_method("handle_collision"):
		get_parent().handle_collision(collision)
	if (auto_rotate):
		get_parent().rotation = velocity.angle()
	
	acceleration *= damping
	velocity *= friction
	
func _process(delta):
	if wall: return
	if hp <= 0: 
		var parent = get_parent()
		if parent.has_method("handle_death"): parent.handle_death()
		else: # Assuming this is an enemy
			game_state.score += 1
			parent.queue_free()
