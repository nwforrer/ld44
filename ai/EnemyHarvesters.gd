extends Node

export (NodePath) var areas_path

signal enemy_harvest

var areas
var harvesters_ready = []

func _ready():
	if areas_path == null:
		print("ERROR: areas_path is empty on ", name)
	
	areas = get_node(areas_path)
	
	for harvester in $Harvesters.get_children():
		harvester.connect("harvest_complete", self, "_on_Harvest_complete", [harvester])
		harvesters_ready.append(harvester)

func _process(delta):
	if $WaitTimer.is_stopped():
		harvesters_ready.clear()
		send_harvesters()
		$WaitTimer.start()

func send_harvesters():
	var target = areas.get_child(0)
	get_tree().call_group("EnemyHarvester", "move_to_target", target)

func _on_Harvest_complete(target:HarvestArea, harvester):
	harvesters_ready.append(harvester)
	if target.harvest_body():
		emit_signal("enemy_harvest")