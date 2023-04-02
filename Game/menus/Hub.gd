extends Control

func _process(_delta):
	if Global.ui:
		show()
	else:
		queue_free()

func _on_power_generator_pressed():
	if Global.ui:
		var power_gen = preload("res://Game/management/power_generator.tscn").instantiate()
		get_parent().add_child(power_gen)

func _on_button_pressed():
	Global.in_world = true
	Global.ui = false

func _on_waste_collector_pressed():
	if Global.ui:
		var waste_filtrator = preload("res://Game/management/waste_filtrator_and_collctor.tscn").instantiate()
		get_parent().add_child(waste_filtrator)

func _on_shop_pressed():
	if Global.ui:
		var shop = preload("res://Game/menus/shop.tscn").instantiate()
		get_parent().add_child(shop)

func _on_water_tank_pressed():
	if Global.ui:
		var water_tank = preload("res://Game/management/water_tank.tscn").instantiate()
		get_parent().add_child(water_tank)
