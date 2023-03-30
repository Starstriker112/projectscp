extends Control

func _on_power_generator_pressed():
	get_tree().change_scene_to_file("res://Game/management/power_generator.tscn")

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Game/world/world.tscn")
