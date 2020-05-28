extends "res://Characters/Character.gd"

signal player_died
	
func _physics_process(delta: float) ->void:
	move_and_slide(_speed, _FLOOR_NORMAL)
	is_collide_with_deadly_object()

func _input(event: InputEvent) ->void:
	if event.is_action_pressed("switch_sides"):
		if is_on_floor() or is_on_ceiling():
			_speed.y *= -1

func is_collide_with_deadly_object() -> void:
	var collision_index = get_slide_count()
	if collision_index > 0:
		var collide_with: = get_slide_collision(collision_index - 1)
		if collide_with.collider.name == "RedPlatform":
			emit_signal("player_died")
			queue_free()
