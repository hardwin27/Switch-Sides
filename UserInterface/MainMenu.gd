tool
extends Control

onready var play_button: = $VBoxContainer/PlayButton
onready var quit_button: = $VBoxContainer/PlayButton

export(String, FILE) var next_scene_path: = ""

func _on_PlayButton_pressed():
	get_tree().change_scene(next_scene_path)

func _on_QuitButton_pressed():
	get_tree().quit()

func _get_configuration_warning() -> String:
	return "Error. No next_scene_path set yet" if next_scene_path == "" else ""
