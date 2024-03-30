extends StaticBody2D


func _physics_process(delta):
	global_rotation += 10 * delta;
