extends Node2D

func _process(_delta):
	if Global.ui:
		show()
	else:
		queue_free()

func _on_back_pressed():
	queue_free()
