extends Node2D

func _ready():
	for area in $Areas.get_children():
		area.connect("area_clicked", self, "_on_Area_clicked", [area.global_position])

func _on_Area_clicked(position):
	get_tree().call_group("Harvester", "harvest", position)
