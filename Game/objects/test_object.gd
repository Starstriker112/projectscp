extends StaticBody2D

var sprite
var col
var parent_name
@export var type = 1

func _ready():
	col = get_node("CollisionShape2D")
	show()
	Global.blocks_data[name] = {}
	Global.blocks_data[name]["x"] = position.x
	Global.blocks_data[name]["y"] = position.y
	Global.blocks_data[name]["type"] = type
	col.disabled = false

func  _unhandled_input(event):
	if Input.is_action_just_pressed("reset"):
		Global.blocks_data.erase(name)
		queue_free()

func _process(delta):
	#print(get_parent().name)
	#if can_drag:
		#self.position = get_global_mouse_position()
	if Global.in_world:
		show()
		col.disabled = false
	else:
		hide()
		col.disabled = true

func _on_area_2d_input_event(viewport, event, shape_idx):
	if not event == InputEventMouseMotion:
		if Input.is_action_just_pressed("ui_rightclick") and event.pressed:
			Global.blocks += 1
			Global.blocks_data.erase(name)
			queue_free()
		
func free():
	Global.blocks_data.erase(name)
	queue_free()
