extends StaticBody2D

func interact():
	if GameManager.player_node.is_holding_item:
		$DropParticles.texture = GameManager.player_node.tmp_item_texture
		$DropParticles.restart()
		GameManager.player_node.remove_item()
