extends Control

func _on_power_generator_pressed():
	get_tree().change_scene_to_file("res://Game/management/power_generator.tscn")

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Game/world/world.tscn")

func _on_waste_collector_pressed():
	get_tree().change_scene_to_file("res://Game/management/waste_filtrator_and_collctor.tscn")

func _on_shop_pressed():
	get_tree().change_scene_to_file("res://Game/menus/shop.tscn")
