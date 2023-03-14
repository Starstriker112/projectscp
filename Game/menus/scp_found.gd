extends Control

func _on_send_pressed():
	print("send team")
	queue_free()

func _on_cancel_pressed():
	queue_free()
