extends Area2D

func _input(event):
	if event.is_action_pressed("shoot"):
		shoot()

func shoot():
	print("Arma: atirou")
	const WIND = preload("res://assets/weapons/wind.tscn")
	var new_wind = WIND.instantiate()
	print(%Furo.global_position)
	new_wind.global_position = %Furo.global_position
	#new_wind.global_rotation = %Furo.global_rotation
	#new_wind.global_position.y -= 200
	%Furo.add_child(new_wind)
	pass
	
