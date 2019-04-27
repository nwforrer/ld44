extends Node2D

class_name HarvestArea

signal area_clicked

func _on_Area_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		emit_signal("area_clicked")

func harvest_body():
	if $Bodies.get_children().size() > 0:
		$Bodies.get_child(0).queue_free()
		return true
	return false