extends Control

var bodies

func _ready():
	bodies = 0
	_update_body_count()

func harvest_body():
	bodies += 1
	_update_body_count()

func _update_body_count():
	$BodyCount.text = str(bodies)