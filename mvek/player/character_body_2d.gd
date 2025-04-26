extends CharacterBody2D

@export var speed: float = 200.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Сбрасываем скорость
	velocity = Vector2.ZERO
	
	# Обрабатываем ввод с клавиш WASD
	if Input.is_key_pressed(KEY_D):
		velocity.x += speed
		animated_sprite.play("d")
	elif Input.is_key_pressed(KEY_A):
		velocity.x -= speed
		animated_sprite.play("a")
	
	if Input.is_key_pressed(KEY_W):
		velocity.y -= speed
		animated_sprite.play("w")
	elif Input.is_key_pressed(KEY_S):
		velocity.y += speed
		animated_sprite.play("s")
	
	# Если есть движение - нормализуем вектор скорости
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	else:
		# Если персонаж стоит - проигрываем idle анимацию
		animated_sprite.play("s")
	
	move_and_slide()


func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://level_1.tscn")


func _on_texture_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://level_3.tscn")


func _on_texture_button_4_pressed() -> void:
	get_tree().change_scene_to_file("res://level_4.tscn")


func _on_texture_button_1_pressed() -> void:
	get_tree().change_scene_to_file("res://level_1.tscn")


func _on_texture_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://level_2.tscn")
