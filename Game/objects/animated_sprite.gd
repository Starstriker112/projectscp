extends StaticBody2D

@export var type = 3
func _ready():
	Global.blocks_data[name] = {}
	Global.blocks_data[name]["x"] = position.x
	Global.blocks_data[name]["y"] = position.y
	Global.blocks_data[name]["type"] = type

func _process(delta):
	$Sprite.play("scp")
	
func _on_area_2d_input_event(viewport, event, shape_idx):
	if not event == InputEventMouseMotion:
		if Input.is_action_just_pressed("ui_rightclick") and event.pressed:
			Global.blocks += 1
			Global.blocks_data.erase(name)
			queue_free()
