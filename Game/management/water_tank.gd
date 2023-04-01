extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$"Water Left".text = str(Global.water)+"%"

func _on_back_pressed():
	get_tree().change_scene_to_file("res://Game/menus/Hub.tscn")
