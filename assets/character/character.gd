extends CharacterBody2D
var spd : int = 200
var jump_spd : int = 500
var gravity : int = ProjectSettings.get_setting("physics/2d/default_gravity")
var height : int = 450
var weight : float = 1.5

func _physics_process(delta):
	# velocidade do jogador
	# spd faz referencia a variavel (positiva ou negativa)
	# SPEED sempre é positiva (movimento do player)
	velocity.x = spd
	
	# pra direita
	if Input.is_action_pressed("right"):
		# se a tecla estiver pressionada, aumenta SPEED direita em incrementos de 5 por tick até 200, 
		# então para em 200
		spd += 50
		if spd >= 300:
			spd = 300
	
	# pra esquerda
	if Input.is_action_pressed("left"):
		# se a tecla estiver pressionada, aumenta SPEED esquerda em incrementos de 5 por tick até 200,
		# então para em 200 (é negativo porque move pra esquerda)
		spd -= 50
		if spd <= -300:
			spd = -300
			
	if not Input.is_action_pressed("left") && spd < 0:
		# Se a tecla NÃO estiver sendo pressionada e o valor é menor que 0 (para prevenir 
		# ativação enquando move para direita), diminui velocidade por 6 por tick
		spd += 20
			
	if not Input.is_action_pressed("right") && spd > 0:
		# Se a tecla NÃO estiver sendo pressionada e o valor é maior que 0 (para prevenir 
		# ativação enquando move para esquerda), diminui velocidade por 6 por tick
		spd -= 20
			
	if spd < 10 && spd > -10 && not Input.is_action_pressed("left") && not Input.is_action_pressed("right"):
		# Se spd estiver entre -4 e 4 e nenhum botao pressionado, spd = 0
		# (prevenir movimento se nada estiver sendo pressionado)
		spd = 0
		
	# gravidade
	if not is_on_floor():
		# se não é um pulo
		velocity.y += gravity * delta * weight
	
	# pulo
	if Input.is_action_just_pressed("jump") && is_on_floor():
		# se pulo for pressionado e o character ta no chao
		if spd > 100:
			# se velocidade é mais que 100, multiplica por 1.7 
			# (pula mais alto quando tá rapido), subtrai isso de velocity.y
			# precisa de um numero negativo pra subir
			# (y negativo é subindo na tela)
			velocity.y -= spd * 2.5
		if spd < -100:
			# se a velocidade é menor que -100, multiplica spd por 1.7 
			# e subtrai de velocity.y (pra permanecer negativa)
			velocity.y += spd * 2.5
		if spd > -100 && spd < 100:
			# default jump value
			velocity.y -= jump_spd
	
	# finalmente move o personagem
	move_and_slide()
