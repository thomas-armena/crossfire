extends Node2D


onready var circle = get_node("Circle")

func _process(delta):
	circle.scale.x += delta
	circle.scale.y += delta
	set_modulate(lerp(get_modulate(), Color(1,1,1,0), 0.2))
	
func set_color(new_color):
	circle.set_color(new_color)
