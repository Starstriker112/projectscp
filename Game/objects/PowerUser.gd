extends StaticBody2D

@export var power : int
@export var type = 2
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.blocks_data[name] = {}
	Global.blocks_data[name]["x"] = position.x
	Global.blocks_data[name]["y"] = position.y
	Global.blocks_data[name]["type"] = type

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

func _on_area_2d_input_event(viewport, event, shape_idx):
	if not event == InputEventMouseMotion:
		if Input.is_action_just_pressed("ui_rightclick") and event.pressed:
			Global.blocks += 1
			Global.blocks_data.erase(name)
			queue_free()
