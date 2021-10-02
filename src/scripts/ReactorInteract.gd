extends StaticBody2D

func interact():
	$DropParticles.texture = GameManager.player_node.tmp_item_texture
	$DropParticles.restart()
	GameManager.player_node.remove_item()
