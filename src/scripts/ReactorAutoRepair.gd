extends Node

export var repait_ammount:int=5;

var played1min = false;
var played15sec = false;
var played30sec = false;
var playedarrival = false;

func _ready():
	GameManager.countdown_timer = $GameEndTimer
	GameManager.connect("game_won", self, "game_won")

func _process(delta):
	if not played1min and GameManager.countdown_timer.time_left <= 60:
		played1min = true
		$An1Min.play()
	elif not played30sec and GameManager.countdown_timer.time_left <= 30:
		played30sec = true
		$An30Sec.play()
	elif not played15sec and GameManager.countdown_timer.time_left <= 15:
		played15sec = true
		$An15Sec.play()
	elif not playedarrival and GameManager.countdown_timer.time_left <= 6:
		playedarrival = true
		$Arrival.play()

func game_won():
	$An1Min.stop()
	$An30Sec.stop()
	$An15Sec.stop()
	$Arrival.stop()
	
	played1min = true;
	played15sec = true;
	played30sec = true;
	playedarrival = true;

func _on_Timer_timeout():
	GameManager.remove_reactor_stability(-repait_ammount)

func _on_GameEndTimer_timeout():
	GameManager.game_over()
