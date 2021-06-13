extends Camera2D

export (NodePath) var player1_path
export (NodePath) var player2_path

onready var player1 = get_node(player1_path)
onready var player2 = get_node(player2_path)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	position = (player1.position + player2.position)/2
	var distance = player1.position.distance_to(player2.position)
	
	if distance < 600:
		zoom = Vector2(1, 1)
	else:
		var new_zoom = min(1.5, distance/600)
		zoom = Vector2(new_zoom, new_zoom)
