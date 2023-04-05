extends CharacterBody2D

@export var speed = 400
#var screenSize = get_viewport().get_visible_rect().size
var target = position

func _ready():
	var rng = RandomNumberGenerator.new()
	var nextToggleSeconds = rng.randi_range(5, 10)
	$Timer.start(nextToggleSeconds)

func _physics_process(delta):
	velocity = position.direction_to(target) * speed
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())

func _on_timer_timeout():
	var rng = RandomNumberGenerator.new()
	var rndX = rng.randi_range(50, 500)
	var rndY = rng.randi_range(30, 300)
	if get_owner().has_node("Personnel"):
		rndX = get_owner().get_node("Personnel").position.x
		rndY = get_owner().get_node("Personnel").position.y
	target = Vector2(rndX, rndY)
	look_at(target)
	var nextToggleSeconds = rng.randi_range(5, 10)
	$Timer.start(nextToggleSeconds)

func _on_area_2d_body_entered(body):
	if body.name == "Personnel":
		get_owner().get_node(str(body.name)).queue_free()
		Global._173_personnel -= 1
