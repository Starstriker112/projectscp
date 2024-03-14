class_name Personnel extends CharacterBody2D

var movement_speed := 200
var movement_delta: float
var path: Array[Vector2] = []
var blink = false
signal get_walking_path
signal on_death
var target = Vector2(400.5, 205.23)

func _ready():
	if self.is_in_group("173_pers"):
		Global._173_personnel += 1
		Global.prey_173.append(self)
	$WaterTimer.start(240)
	$WasteTimer.start(240)
	$FoodTimer.start(360)
	$BowelTimer.start(600)
	$BlinkTimer.start(randi_range(3, 6))
	

func _physics_process(delta):
	if Global.in_world:
		if blink:
			blink = not blink
		if path.is_empty():
			return
		velocity = global_position.direction_to(path[0] + target) * movement_speed
		move_and_slide()
		
		if global_position.distance_to(path[0]) <= 10:
			path.pop_front()
			target = Vector2(randfn(0, 2.5), randfn(0, 2.5))
			print(target)

func _on_water_timer_timeout():
	if Global.water <= 0:
		movement_speed = 100
	else:
		movement_speed = 200
		Global.water -= 1
	$WaterTimer.start(240)
	#$WaterTimer.start(10)

func _on_waste_timer_timeout():
	Global.waste += 0.25
	$WasteTimer.start(480)
	#$WaterTimer.start(10)

func _on_food_timer_timeout():
	if Global.food_portions <= 0:
		movement_speed = 100
	else:
		movement_speed = 200
		Global.food_portions -= 1
	$FoodTimer.start(360)
	#$FoodTimer.start(10)

func _on_bowel_timer_timeout():
	if Global.c_kits <= 0:
		movement_speed = 100
	else:
		movement_speed = 200
		Global.c_kits -= 1
	print(Global.c_kits)
	$FoodTimer.start(600)

func die():
	emit_signal("on_death")
	if self.is_in_group("173_pers"):
		Global._173_personnel -= 1
		Global.prey_173.erase(self)
	call_deferred("queue_free")

func _on_blink_timer_timeout():
	blink = true
	print("blink")
	$BlinkTimer.start(randi_range(3, 6))
