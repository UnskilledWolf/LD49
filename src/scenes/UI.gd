extends Control

func _process(delta):
	$CreditsContainer/CreditAmount.text = String(GameManager.constructor_credits)
