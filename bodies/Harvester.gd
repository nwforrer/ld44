extends KinematicBody2D

signal harvest_complete

var home_location
var harvest_target

enum STATES {NONE, MOVING_TO_HARVEST, HARVESTING, MOVING_HOME}

var current_state = STATES.NONE

func _ready():
	home_location = global_position

func _process(delta):
	match current_state:
		STATES.MOVING_TO_HARVEST:
			_move_towards(harvest_target.global_position)
			if (global_position - harvest_target.global_position).length() < 100:
				_change_state(STATES.HARVESTING)
		STATES.HARVESTING:
			if $HarvestTimer.is_stopped():
				emit_signal("harvest_complete", harvest_target)
				_change_state(STATES.MOVING_HOME)
		STATES.MOVING_HOME:
			_move_towards(home_location)
			if (global_position - home_location).length() < 100:
				_change_state(STATES.NONE)

func move_to_target(destination):
	if not current_state == STATES.NONE:
		return

	harvest_target = destination
	_change_state(STATES.MOVING_TO_HARVEST)

func _change_state(new_state):
	match new_state:
		STATES.NONE:
			if $AnimationPlayer.has_animation("idle"):
				$AnimationPlayer.play("idle")
				$person.flip_h = false
		STATES.HARVESTING:
			$HarvestTimer.start()
		STATES.MOVING_TO_HARVEST:
			if $AnimationPlayer.has_animation("walk"):
				$AnimationPlayer.play("walk")
				$person.flip_h = false
		STATES.MOVING_HOME:
			if $AnimationPlayer.has_animation("walk"):
				$AnimationPlayer.play("walk")
				$person.flip_h = true
	current_state = new_state

func _move_towards(destination):
	var intermediate = lerp(global_position, destination, ($LerpTimer.wait_time - $LerpTimer.time_left) / $LerpTimer.wait_time)
	move_and_slide(intermediate - global_position)