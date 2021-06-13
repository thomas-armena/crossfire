extends Line2D

var bullet_is_dead = false
var bullet = null

var max_trail_length = 30

func set_color(new_color):
	gradient = Gradient.new()
	gradient.set_color(0, Color(0,0,0,0))
	gradient.set_color(1, new_color)

func _process(delta):
	if bullet_is_dead:
		clear_point()
		return
	if bullet != null: add_bullet_point()

func clear_point():
	remove_point(0)
	if points.size() <= 1: queue_free()
	pass
	
func add_bullet_point():
	add_point(bullet.position)
	if points.size() > 30:
		remove_point(0)

func stop():
	bullet_is_dead = true

