extends ColorRect

var rng = RandomNumberGenerator.new()
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.ui:
		show()
	else:
		queue_free()
	if Global.collect_173_waste:
		Global.waste += 0.5
		queue_free()
