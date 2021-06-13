extends CPUParticles2D

func _ready():
	pass # Replace with function body.


func _process(delta):
	color = get_parent().color + Color(0.4, 0.4, 0.4)
	if (get_parent().target_player):
		rotation = (get_parent().target_player.position - get_parent().position).angle()
