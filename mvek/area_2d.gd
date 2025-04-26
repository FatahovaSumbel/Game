extends Area2D

@export var target_scene: String = "res://scenes/level_2.tscn"
@export var fade_duration: float = 0.5

var player_in_range := false

func _ready():
	connect("input_event", _on_input_event)
	connect("mouse_entered", _on_mouse_entered)
	connect("mouse_exited", _on_mouse_exited)

func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if player_in_range:
			transition_to_scene()

func _on_mouse_entered():
	# Подсветка при наведении
	$Sprite2D.modulate = Color(1.2, 1.2, 1.2)

func _on_mouse_exited():
	# Сброс подсветки
	$Sprite2D.modulate = Color.WHITE

func transition_to_scene():
	# Блокируем повторные нажатия
	set_process_input(false)
	
	# Эффект затемнения
	var tween = create_tween()
	tween.tween_property($Sprite2D, "modulate", Color.BLACK, fade_duration/2)
	await tween.finished
	
	# Переход на новую сцену
	if ResourceLoader.exists(target_scene):
		get_tree().change_scene_to_file(target_scene)
	else:
		push_error("Scene not found: ", target_scene)
		set_process_input(true)
