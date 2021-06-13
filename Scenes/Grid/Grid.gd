extends Node2D

export (Color) var color = Color(1, 1, 1)
export (float) var width = 256
export (float) var height = 256
export (float) var cell_width = 16
export (float) var cell_height = 16

func _draw():
	var cell_x = width / cell_width
	var cell_y = height / cell_height
	
	for x in range(cell_x + 1):
		for y in range(cell_y + 1):
			draw_line(Vector2(x * cell_width, 0), Vector2(x * cell_width, height), color, 4)
			draw_line(Vector2(0, y * cell_height), Vector2(width, y * cell_height), color, 4)

