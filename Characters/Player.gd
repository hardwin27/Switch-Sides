extends "res://Characters/Character.gd"

	
func _physics_process(delta: float) ->void:
	move_and_slide(_speed, _FLOOR_NORMAL)

func _input(event: InputEvent) ->void:
	if event.is_action_pressed("switch_sides"):
		_speed.y *= -1
