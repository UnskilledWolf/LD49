extends Control

func _process(delta):
	$CreditsContainer/CreditAmount.text = String(GameManager.constructor_credits)
	$TimerContainer/TimerAmount.text = String(GameManager.countdown_timer.time_left)
