extends CharacterBody2D

@export var speed = 400
@export var type = 2662
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
	var nextToggleSeconds = rng.randi_range(5, 15)
	$Timer.start(nextToggleSeconds)

func _physics_process(delta):
	Global.scp_data[name]["x"] = position.x
	Global.scp_data[name]["y"] = position.y
	velocity = position.direction_to(target) * speed
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())

func _on_timer_timeout():
	var rng = RandomNumberGenerator.new()
	var rndX = rng.randi_range(0, 1000)
	var rndY = rng.randi_range(0, 1000)
	target = Vector2(rndX, rndY)
	var nextToggleSeconds = rng.randi_range(5, 10)
	$Timer.start(nextToggleSeconds)
