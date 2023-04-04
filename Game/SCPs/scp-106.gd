extends CharacterBody2D

@export var speed = 400
#var screenSize = get_viewport().get_visible_rect().size
var target = position

func _ready():
	var rng = RandomNumberGenerator.new()
	var nextToggleSeconds = rng.randi_range(5, 10)
	$Timer.start(nextToggleSeconds)

func _physics_process(_delta):
	if Global._173_personnel <= 1:
		position = target

func _on_timer_timeout():
	var rng = RandomNumberGenerator.new()
	if Global._173_personnel <= 1:
		var rndX = rng.randi_range(50, 500)
		var rndY = rng.randi_range(30, 300)
		if get_owner().has_node("Personnel"):
			rndX = get_owner().get_node("Personnel").position.x
			rndY = get_owner().get_node("Personnel").position.y
		target = Vector2(rndX, rndY)
		print("SCP-173 can move")
		print(target)
		look_at(target)
	else:
		print("SCP-173 can move")
	var nextToggleSeconds = rng.randi_range(5, 10)
	$Timer.start(nextToggleSeconds)

func _on_area_2d_body_entered(body):
	if Global._173_personnel <= 1:
		if body.name == "Personnel":
			get_owner().get_node(str(body.name)).queue_free()
			Global._173_personnel -= 1
