extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.ui:
		show()
	else:
		queue_free()
	$"Water Left".text = str(Global.water)+"%"

func _on_back_pressed():
	queue_free()
