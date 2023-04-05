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

func _on_scp_999_pressed():
	if Global.ui:
		var scp_999 = preload("res://Game/SCPs/999-containment.tscn").instantiate()
		get_parent().add_child(scp_999)

func _on_scp_005_pressed():
	if Global.ui:
		var scp_005 = preload("res://Game/SCPs/scp-005.tscn").instantiate()
		get_parent().add_child(scp_005)

func _on_scp_173_pressed():
	if Global.ui:
		var scp_173 = preload("res://Game/SCPs/173-containment.tscn").instantiate()
		get_parent().add_child(scp_173)

func _on_scp_2662_pressed():
	if Global.ui:
		var scp_2662 = preload("res://Game/SCPs/2662-containment.tscn").instantiate()
		get_parent().add_child(scp_2662)

func _on_scp_002_pressed():
	if Global.ui:
		var scp_002 = preload("res://Game/SCPs/002-containment.tscn").instantiate()
		get_parent().add_child(scp_002)

func _on_scp_500_pressed():
	if Global.ui:
		var scp_500 = preload("res://Game/SCPs/500-containment.tscn").instantiate()
		get_parent().add_child(scp_500)

func _on_scp_096_pressed():
	if Global.ui:
		var scp_096 = preload("res://Game/SCPs/096-containment.tscn").instantiate()
		get_parent().add_child(scp_096)

func _on_scp_1507_pressed():
	if Global.ui:
		var scp_1507 = preload("res://Game/SCPs/1507-containment.tscn").instantiate()
		get_parent().add_child(scp_1507)
