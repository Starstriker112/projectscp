extends Control

func _on_1_block_pressed():
	if Global.money >= 5:
		Global.money -= 5
		Global.blocks += 1

func _on_10_blocks_pressed():
	if Global.money >= 50:
		Global.money -= 50
		Global.blocks += 10

func _on_50_blocks_pressed():
	if Global.money >= 250:
		Global.money -= 250
		Global.blocks += 50

func _on_100_blocks_pressed():
	if Global.money >= 500:
		Global.money -= 500
		Global.blocks += 100

func _on_back_pressed():
	get_tree().change_scene_to_file("res://Game/menus/Hub.tscn")
