extends Node2D

var rng = RandomNumberGenerator.new()

func _ready():
	#$Timer.start(rng.randi_range(60, 270))
	$Timer.start(5)

func _process(_delta):
	if Global.ui:
		show()
	else:
		queue_free()

func _on_back_pressed():
	queue_free()

func _on_timer_timeout():
	var clone = preload("res://Game/SCPs/scp-173-waste.tscn").instantiate()
	var x_pos = rng.randi_range(0, 600)
	var y_pos = rng.randi_range(0, 400)
	clone.global_position = Vector2(x_pos, y_pos)
	get_parent().add_child(clone)
	$Timer.start(rng.randi_range(60, 270))


func _on_collect_waste_pressed():
	Global.collect_173_waste = true
	var w_timer = Timer.new()
	w_timer.wait_time = 2
	w_timer.timeout.connect(_on_waste_timer_timeout)
	w_timer.start()

func _on_waste_timer_timeout():
	Global.collect_173_waste = false
