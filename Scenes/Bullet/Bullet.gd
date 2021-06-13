extends KinematicBody2D

var BULLET_TRAIL = preload("res://Scenes/Bullet/Trail/Trail.tscn")
var BULLET_IMPACT = preload("res://Scenes/Bullet/Impact/Impact.tscn")

export var speed = 10
export var direction = 0
export var damage = 20
export var color = Color(1,1,1)

onready var bullet_trail = BULLET_TRAIL.instance()
onready var circle = get_node("Circle")
onready var shoot_impact_sound = get_node("ShootImpact")

func _ready():
	bullet_trail.bullet = self
	get_tree().get_current_scene().add_child(bullet_trail)

	
func set_color(new_color):
	color = new_color
	circle.set_color(new_color)
	bullet_trail.set_color(new_color)
	
func _physics_process(delta):
	var dir = PI
	var velocity = Vector2(cos(direction), sin(direction)) * speed
	var collision = move_and_collide(velocity)
	if collision: handle_collision(collision)
	
func handle_collision(collision):
	die()
	collision.collider.entity.impulse_by_angle(direction,10000)
	collision.collider.entity.damage(20)

func _on_DeathTimer_timeout():
	die()
	
func die():
	bullet_trail.stop()
	var impact = BULLET_IMPACT.instance()
	get_tree().get_current_scene().add_child(impact)
	impact.set_color(color)
	impact.position = position
	impact.play_sound()
	queue_free()
