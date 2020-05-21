extends Node

signal score_updated
signal player_died

var score: = 0 setget set_score
var death_count: = 0 setget set_death_count

func reset() -> void:
	score = 0
	death_count = 0

func set_score(value: int) -> void:
	score = value
	emit_signal("score_updated")

func set_death_count(value: int) -> void:
	death_count = value
	emit_signal("player_died")
