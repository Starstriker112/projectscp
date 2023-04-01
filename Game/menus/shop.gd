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


func _on_1_water_pressed():
	if Global.money >= 1:
		Global.money -= 1
		Global.water += 1

func _on_10_water_pressed():
	if Global.money >= 10:
		Global.money -= 10
		Global.water += 10

func _on_50_water_pressed():
	if Global.money >= 50:
		Global.money -= 50
		Global.water += 50

func _on_complete_refill_pressed():
	if Global.money >= 100:
		Global.money -= 100
		Global.water = 100

func _on_1_food_pressed():
	if Global.money >= 15:
		Global.money -= 15
		Global.food_portions += 1

func _on_10_food_pressed():
	if Global.money >= 150:
		Global.money -= 150
		Global.food_portions += 10

func _on_50_food_pressed():
	if Global.money >= 750:
		Global.money -= 750
		Global.food_portions += 50

func _on_100_food_pressed():
	if Global.money >= 1500:
		Global.money -= 1500
		Global.food_portions += 100

func _on_1_kit_pressed():
	if Global.money >= 35:
		Global.money -= 35
		Global.c_kits += 1

func _on_10_kits_pressed():
	if Global.money >= 350:
		Global.money -= 350
		Global.c_kits += 10

func _on_50_kits_pressed():
	if Global.money >= 1750:
		Global.money -= 1750
		Global.c_kits += 50

func _on_100_kits_pressed():
	if Global.money >= 3500:
		Global.money -= 3500
		Global.c_kits += 100
