extends CharacterBody2D

@export var speed = 400
#var screenSize = get_viewport().get_visible_rect().size
var target = position

func _ready():
	var rng = RandomNumberGenerator.new()
	var nextToggleSeconds = rng.randi_range(5, 15)
	$Timer.start(nextToggleSeconds)
	velocity = position.direction_to(target) * speed
	
func _physics_process(delta):
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
