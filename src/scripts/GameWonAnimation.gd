extends AnimationPlayer

func _ready():
	GameManager.connect("game_won", self, "_on_game_won")

func _on_game_won():
	self.play("GameWon")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "GameWon":
		get_tree().change_scene("res://src/scenes/GameWon.tscn")
