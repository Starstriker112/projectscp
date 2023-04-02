extends Node2D

func _process(delta):
	if Global.ui:
		show()
	else:
		queue_free()
