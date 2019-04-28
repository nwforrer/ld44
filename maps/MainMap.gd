extends Node2D

func _ready():
	for area in $Areas.get_children():
		area.connect("area_clicked", self, "_on_Area_clicked", [area])
	for harvester in $Harvesters.get_children():
		harvester.connect("harvest_complete", self, "_on_Harvest_complete")

func _on_Area_clicked(target:HarvestArea):
	get_tree().call_group("PlayerHarvester", "move_to_target", target)

func _on_Harvest_complete(target:HarvestArea):
	if target.harvest_body():
		$UI.harvest_body()
		$UI.update_territory()


func _on_EnemyHarvesters_enemy_harvest():
	$UI.enemy_harvest_body()
