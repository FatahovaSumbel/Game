extends Node2D


func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://level_2.tscn")


func _on_texture_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://level_3.tscn")


func _on_texture_button_4_pressed() -> void:
	get_tree().change_scene_to_file("res://level_4.tscn")
