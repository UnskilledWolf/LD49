extends StaticBody2D

export var damage:float 

func interact():
	GameManager.player_node.give_item($Sprite.texture, damage)
	queue_free()
