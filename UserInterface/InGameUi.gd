extends Control

onready var score_label_ceiling: = $ScoreLabelCeiling
onready var score_label_floor: = $ScoreLabelFloor
onready var score_label_text = score_label_ceiling.text
onready var scene_tree: = get_tree()
onready var pause_menu: = $PauseMenu

var paused: = false setget set_paused

func _ready() -> void:
	PlayerData.connect("score_updated", self, "update_screen")
	update_screen()
	
func _unhandled_input(event: InputEvent) ->void:
	if event.is_action_pressed("pause"):
		self.paused = not paused
		

func update_screen() -> void:
	score_label_ceiling.text = score_label_text % PlayerData.score
	score_label_floor.text = score_label_text % PlayerData.score

func set_paused(value: bool) -> void:
	paused = value
	scene_tree.paused = value
	pause_menu.visible = value
