extends Control

func _ready():
	# Reset game manager. Mainly for second plays
	GameManager.reactor_stability=100
	GameManager.constructor_credits=0

func _on_Button_pressed():
	get_tree().change_scene("res://src/scenes/Intro.tscn")

func _on_Button2_pressed():
	get_tree().quit()
