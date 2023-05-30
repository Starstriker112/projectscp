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
var blocks_data = {}
var stats = []
var scp_data = {}
var reset = true
var timer = Timer.new()
var block_1_preload = preload("res://Game/objects/test_object.tscn")
var block_2_preload = preload("res://Game/objects/PowerUser.tscn")
var block_3_preload = preload("res://Game/objects/animated_sprite.tscn")
const BLOCKS_SAVE_FILE_NAME = "user://blocks.save"
const STATS_SAVE_FILE_NAME = "user://stats.save"
const SCPS_SAVE_FILE_NAME = "user://SCPs.save"

func _ready():
	print(containment_breach["173"])
	var scene = self
	timer.wait_time = 1800
	timer.timeout.connect(_days_timeout)
	scene.add_child(timer)
	timer.start()

func _process(delta):
	stats = [generated_power, blocks, waste, money, days, months, water, food_portions, c_kits]
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

func _save():
	var json_data := JSON.stringify(blocks_data)
	var file_access := FileAccess.open(BLOCKS_SAVE_FILE_NAME, FileAccess.WRITE)
	file_access.store_line(json_data)
	file_access.close()
	json_data = JSON.stringify(stats)
	file_access = FileAccess.open(STATS_SAVE_FILE_NAME, FileAccess.WRITE)
	file_access.store_line(json_data)
	file_access.close()
	json_data = JSON.stringify(scp_data)
	file_access = FileAccess.open(SCPS_SAVE_FILE_NAME, FileAccess.WRITE)
	file_access.store_line(json_data)
	file_access.close()
	
func _load(map):
	if not FileAccess.file_exists(BLOCKS_SAVE_FILE_NAME):
		return
	var file_access := FileAccess.open(BLOCKS_SAVE_FILE_NAME, FileAccess.READ)
	var json_data := file_access.get_line()
	file_access.close()
	var data: Dictionary = JSON.parse_string(json_data)
	print(data)
	for i in data.values():
		if i["type"] == 1:
			var block = block_1_preload.instantiate()
			block.position.x = i["x"]
			block.position.y = i["y"]
			map.add_child(block)
		elif i["type"] == 2:
			var block = block_2_preload.instantiate()
			block.position.x = i["x"]
			block.position.y = i["y"]
			map.add_child(block)
		elif i["type"] == 3:
			var block = block_3_preload.instantiate()
			block.position.x = i["x"]
			block.position.y = i["y"]
			map.add_child(block)
		else:
			print("Error while loading blocks")
	if not FileAccess.file_exists(STATS_SAVE_FILE_NAME):
		return
	file_access = FileAccess.open(STATS_SAVE_FILE_NAME, FileAccess.READ)
	json_data = file_access.get_line()
	file_access.close()
	var _data = JSON.parse_string(json_data)
	sync_stats(_data)
	file_access = FileAccess.open(SCPS_SAVE_FILE_NAME, FileAccess.READ)
	json_data = file_access.get_line()
	file_access.close()
	data = JSON.parse_string(json_data)
	scp_data = data

func sync_stats(data):
	generated_power = data[0]
	blocks = data[1]
	money = data[2]
	days = data[3]
	months = data[4]
	water = data[5]
	food_portions = data[6]
	c_kits = data[7]
