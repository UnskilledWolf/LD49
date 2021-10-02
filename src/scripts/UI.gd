extends Control

func _process(delta):
	$Panel/CreditsContainer/CreditAmount.text = String(GameManager.constructor_credits)
	$Panel/TimerContainer/TimerAmount.text = String(floor(GameManager.countdown_timer.time_left))
