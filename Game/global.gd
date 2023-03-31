extends Node

var can_create = true
var item_selected = 1
var generating_energy
var generated_power = 0
var blocks = 10
var waste = 0
var money = 500
var days = 0
var months = 0
var timer = Timer.new()

func _ready():
	var scene = self
	timer.wait_time = 54000
	timer.timeout.connect(_days_timeout)
	scene.add_child(timer)
	timer.start()

func _process(delta):
	if generating_energy:
		generated_power += 1*delta
		print("Generating energy")
		print(generated_power)
	else:
		print("Not generating energy")
		
func _days_timeout():
	print(str(days)+" "+str(months))
	days += 1
	if days >= 30:
		money += 1000
		months += 1
		days -= 30
	timer.start()
