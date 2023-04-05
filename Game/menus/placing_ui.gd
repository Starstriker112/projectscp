extends ColorRect

func _on_exit_pressed():
	Global.p_ui_inst = false
	queue_free()

func _on_test_object_pressed():
	Global.item_selected = 1

func _on_scp_pressed():
	Global.item_selected = 2

func _on_animated_sprite_pressed():
	Global.item_selected = 3
