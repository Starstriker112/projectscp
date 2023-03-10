extends Area2D

@onready var test_object = preload("res://objects/test_object.tscn")

func  _unhandled_input(event):
		if Input.is_action_just_pressed("ui_leftclick"):
			var clone = test_object.instantiate()
			clone.position = get_global_mouse_position()
			get_parent().add_child(clone)
			set_process_input(false)
		else:
			set_process_input(true)

func _process(delta):
	if is_processing_input():
		position = get_global_mouse_position()
