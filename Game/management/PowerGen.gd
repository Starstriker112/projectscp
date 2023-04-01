extends Node2D

@onready var label = get_node("Generating")

func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.generating_energy:
		label.text = "Generating energy"
	else:
		label.text = "Not generating energy"

func _on_Start_pressed():
	Global.generating_energy = true
	
func _on_Stop_pressed():
	Global.generating_energy = false

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Game/menus/Hub.tscn")
