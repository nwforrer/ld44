extends KinematicBody2D

var harvesting = false
var harvesting_destination

func _process(delta):
	if harvesting:
		var intermediate = lerp(global_position, harvesting_destination, ($LerpTimer.wait_time - $LerpTimer.time_left) / $LerpTimer.wait_time)
		move_and_slide(intermediate - global_position)
		if (global_position - harvesting_destination).length() < 100:
			harvesting = false

func harvest(destination):
	if harvesting:
		return
	
	harvesting = true
	harvesting_destination = destination
	
	print(name, " harvesting at ", destination)
	