extends StaticBody2D

export var damage:float 

func interact():
	if not GameManager.player_node.is_holding_item:
		GameManager.player_node.give_item($Sprite.texture, damage)
		queue_free()
