extends Node2D

var test_object = preload("res://Game/objects/test_object.tscn")
var walk_test = preload("res://Game/AI/walk.tscn")
var scp_found = preload("res://Game/menus/scp_found.tscn")
var mode = 0

func _unhandled_input(event):
	if Global.can_create:
		if event.is_action_pressed("ui_leftclick"):
			if Global.item_selected == 1:
				var clone = test_object.instantiate()
				clone.position = get_global_mouse_position()
				get_parent().add_child(clone)
			elif Global.item_selected == 2:
				var clone = walk_test.instantiate()
				clone.position = get_global_mouse_position()
				get_parent().add_child(clone)
	if event.is_action_pressed("item1"):
		Global.item_selected = 1
	if event.is_action_pressed("item2"):
		Global.item_selected = 2

func _process(delta):
	pass 


func _on_button_pressed():
	var i = scp_found.instantiate()
	i.position.y = 10
	get_parent().add_child(i)
