extends KinematicBody2D

onready var entity = get_node("Entity")

var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	print(entity.hp)




func _process(delta):
	pass
