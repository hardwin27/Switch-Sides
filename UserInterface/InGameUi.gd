extends Control

onready var score_label_ceiling: = $ScoreLabelCeiling
onready var score_label_floor: = $ScoreLabelFloor
onready var score_label_text = score_label_ceiling.text
onready var scene_tree: = get_tree()
onready var pause_menu: = $PauseMenu
onready var main_menu_button: = $PauseMenu/Menu/MainMenu

const main_menu: = "res://UserInterface/MainMenu.tscn"

var paused: = false setget set_paused

func _ready() -> void:
	PlayerData.connect("score_updated", self, "update_screen")
	update_screen()

func _unhandled_input(event: InputEvent) ->void:
	if event.is_action_pressed("pause"):
		self.paused = not paused

func _on_QuitButton_pressed():
	get_tree().change_scene(main_menu)
	get_tree().paused = false

func _on_RetryButton_pressed():
	PlayerData.score = 0
	get_tree().paused = false
	get_tree().reload_current_scene()

func update_screen() -> void:
	score_label_ceiling.text = score_label_text % PlayerData.score
	score_label_floor.text = score_label_text % PlayerData.score

func set_paused(value: bool) -> void:
	paused = value
	scene_tree.paused = value
	pause_menu.visible = value
