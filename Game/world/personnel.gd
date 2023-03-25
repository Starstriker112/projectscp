class_name Personnel extends CharacterBody2D

var movement_speed := 200
var movement_delta: float
var path: Array[Vector2] = []

signal get_walking_path
var target = Vector2(400.5, 205.23)

func _physics_process(delta):
	if path.is_empty():
		return
	velocity = global_position.direction_to(path[0] + target) * movement_speed
	move_and_slide()
	
	if global_position.distance_to(path[0]) <= 10:
		path.pop_front()
		target = Vector2(randfn(0, 2.5), randfn(0, 2.5))
		print(target)
