extends Area2D

onready var _animation_player: = $AnimationPlayer

func _on_Coin_body_entered(body):
	_animation_player.play("picked")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "picked":
		queue_free()
