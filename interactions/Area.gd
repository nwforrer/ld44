extends Node2D

class_name HarvestArea

signal area_clicked

func _on_Area_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		emit_signal("area_clicked")

func harvest_body():
	for coffin in $Bodies.get_children():
		if coffin.is_available:
			coffin.claim()
			return true
	return false

func add_body():
	for coffin in $Bodies.get_children():
		if not coffin.is_available:
			coffin.restore()
			return true
	return false