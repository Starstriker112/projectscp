extends Node2D
var pers = preload("res://personnel.tscn")

func spawn_personnel():
	var p = pers.instantiate()
	p.position.x = randf_range(70, 1112)
	p.position.y = randf_range(70, 600)
	p.add_to_group("173_pers")
	p.connect("on_death", _on_pers_death)
	self.add_child(p)

func _ready():
	spawn_personnel()

func _process(_delta):
	pass

func _on_pers_death():
	print("Death")
	spawn_personnel()
