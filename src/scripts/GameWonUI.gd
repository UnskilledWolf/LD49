extends Control

func _ready():
	$CenterContainer/VBoxContainer/Button.grab_focus()

func _on_Button_pressed():
	get_tree().change_scene("res://src/scenes/MainMenu.tscn")
