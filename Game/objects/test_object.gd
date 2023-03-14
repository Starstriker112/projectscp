extends Area2D

var can_drag
var selected = false
var sprite
var col

func _ready():
	sprite = get_node("Sprite2D")
	col = get_node("CollisionShape2D")

func  _unhandled_input(event):
	if Input.is_action_just_pressed("reset"):
		queue_free()

func _process(delta):
	if can_drag:
		self.position = get_global_mouse_position()

func _on_mouse_entered():
	selected = true
	Global.can_create = false

func _on_mouse_exited():
	selected = false
	Global.can_create = true

func _on_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("ui_rightclick"):
		if event.pressed:
			queue_free() #destroy instance
		#if selected:
			#can_drag = true #drag objects
		
	if Input.is_action_just_pressed("ui_leftclick"):
		if selected:
			can_drag = false
