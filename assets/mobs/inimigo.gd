extends CharacterBody2D

var gravity : int = ProjectSettings.get_setting("physics/2d/default_gravity")
var weight: float = .05

func _physics_process(delta):
	velocity.y += gravity * delta * weight
	move_and_slide()


func take_damage():
	print("Inimigo: levou lapada")
