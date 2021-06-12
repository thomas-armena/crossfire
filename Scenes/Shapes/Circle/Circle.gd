extends Node2D

export var color = Color(0.0, 0.0, 0.0)
export var radius = 32

func _ready():
	pass # Replace with function body.

func _draw():
	var center = Vector2(0, 0)
	var angle_from = 0
	var angle_to = 360
	
	var nb_points = 32
	var points_arc = PoolVector2Array()
	points_arc.push_back(center)
	var colors = PoolColorArray([color])

	for i in range(nb_points + 1):
		var angle_point = deg2rad(angle_from + i * (angle_to - angle_from) / nb_points - 90)
		points_arc.push_back(center + Vector2(cos(angle_point), sin(angle_point)) * radius)
	draw_polygon(points_arc, colors)

