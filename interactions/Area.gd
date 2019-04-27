extends Area2D

signal area_clicked

func _on_Area_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		emit_signal("area_clicked")
