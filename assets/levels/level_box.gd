extends CharacterBody2D

func _ready():
	pass
	
func _on_timer_timeout():
	rotate_level();

func _physics_process(delta):
	pass
	#global_rotation += 1 * delta;

func rotate_level():
	global_rotation += 90.0
	move_and_slide()
