extends Node

export var repait_ammount:int=5;

func _ready():
	GameManager.countdown_timer = $GameEndTimer

func _on_Timer_timeout():
	GameManager.remove_reactor_stability(-repait_ammount)

func _on_GameEndTimer_timeout():
	GameManager.game_over()
