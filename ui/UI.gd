extends CanvasLayer

var bodies

func _ready():
	bodies = 0
	$TerritoryBar.value = $TerritoryBar.max_value / 2
	_update_body_count()

func harvest_body():
	bodies += 1
	_update_body_count()

func enemy_harvest_body():
	$TerritoryBar.value -= 1

func update_territory():
	$TerritoryBar.value += 1

func _update_body_count():
	$BodyCount.text = str(bodies)
