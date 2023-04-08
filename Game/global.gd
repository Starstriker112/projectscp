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
var water = 100
var food_portions = 0
var c_kits = 0
var in_world = true
var ui = false
var _173_personnel = 0
var p_ui_inst = false
var collect_173_waste = false
var containment_breach = {"173"=false}
var timer = Timer.new()

func _ready():
	print(containment_breach["173"])
	var scene = self
	timer.wait_time = 1800
	timer.timeout.connect(_days_timeout)
	scene.add_child(timer)
	timer.start()

func _process(delta):
	if generating_energy:
		generated_power += 1*delta
	else:
		pass
		
	if water > 100:
		water = 100
	if waste > 100:
		waste = 100
func _days_timeout():
	print(str(days)+" "+str(months))
	days += 1
	if days >= 30:
		money += 1000
		months += 1
		days -= 30
	timer.start()
