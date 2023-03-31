extends Node

var can_create = true
var item_selected = 1
var generating_energy
var generated_power = 0
var blocks = 10

func _process(delta):
	if generating_energy:
		generated_power += 1*delta
		print("Generating energy")
		print(generated_power)
	else:
		print("Not generating energy")
