extends StaticBody2D

func interact():
	GameManager.computer_interact()
	$AudioStreamPlayer2D.play()
