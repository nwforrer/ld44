extends Sprite

class_name Coffin

export (bool) var is_available = true

func _ready():
	if not is_available:
		hide()

func claim():
	is_available = false
	hide()

func restore():
	is_available = true
	show()