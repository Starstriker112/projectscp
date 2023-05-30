extends CharacterBody2D

@export var speed = 400
@export var type = 173
#var screenSize = get_viewport().get_visible_rect().size
var target = position

func _ready():
	if Global.scp_data.has(name) and Global.scp_data[name].has("x"):
		position.x = Global.scp_data[name]["x"]
	if Global.scp_data.has(name) and Global.scp_data[name].has("y"):
		position.y = Global.scp_data[name]["y"]
	Global.scp_data[name] = {}
	Global.scp_data[name]["type"] = type
	var rng = RandomNumberGenerator.new()
	var nextToggleSeconds = rng.randi_range(5, 10)
	$Timer.start(nextToggleSeconds)

func _physics_process(_delta):
	Global.scp_data[name]["x"] = position.x
	Global.scp_data[name]["y"] = position.y
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
		print(target)
		look_at(target)
	var nextToggleSeconds = rng.randi_range(5, 10)
	$Timer.start(nextToggleSeconds)

func _on_area_2d_body_entered(body):
	if Global._173_personnel <= 1:
		if body.name == "Personnel":
			get_owner().get_node(str(body.name)).queue_free()
			Global._173_personnel -= 1
