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


func _on_CoffinSpawnTimer_timeout():
	var area_count = $Areas.get_children().size()
	var try_count = 5
	var try = 0
	for try in range(try_count):
		var area_index = randi()%area_count
		print("area_index ", area_index)
		var rand_area:Area = $Areas.get_child(area_index)
		if rand_area.add_body():
			break
	
