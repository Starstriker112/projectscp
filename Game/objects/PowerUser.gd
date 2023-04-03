extends StaticBody2D

@export var power : int
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Global.generated_power -= power/10*delta
	if Global.in_world:
		get_node("CollisionShape2D").disabled = false
	else:
		get_node("CollisionShape2D").disabled = true

func _on_waste_timer_timeout():
	Global.waste += 1
	$WasteTimer.start(60)
	print(Global.waste)
