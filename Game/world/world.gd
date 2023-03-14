extends Node2D

var test_object = preload("res://Game/objects/test_object.tscn")
var scp_found = preload("res://Game/menus/scp_found.tscn")
var mode = 0

func _unhandled_input(event):
	if Global.can_create:
		if event.is_action_pressed("ui_leftclick"):
			var clone = test_object.instantiate()
			clone.position = get_global_mouse_position()
			get_parent().add_child(clone)

func _process(delta):
	pass 


func _on_button_pressed():
	var i = scp_found.instantiate()
	i.position.y = 10
	get_parent().add_child(i)
