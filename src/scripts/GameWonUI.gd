extends Control

func _ready():
	$CenterContainer/VBoxContainer/Button.grab_focus()

func _on_Button_pressed():
	print(self.name)
	if self.name != "Intro":
		get_tree().change_scene("res://src/scenes/MainMenu.tscn")
	else:
		get_tree().change_scene("res://src/scenes/main.tscn")
