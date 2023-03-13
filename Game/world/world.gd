extends Node2D

var test_object = preload("res://Game/objects/test_object.tscn")

func _unhandled_input(event):
	if Global.can_create:
		if event.is_action_pressed("ui_leftclick"):
			var clone = test_object.instantiate()
			clone.position = get_global_mouse_position()
			get_parent().add_child(clone)

func _process(delta):
	pass
