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
	$C_space.text = str(int(Global.waste))+"%"

func _on_burn_waste_pressed():
	Global.waste = 0


func _on_back_pressed():
	queue_free()
