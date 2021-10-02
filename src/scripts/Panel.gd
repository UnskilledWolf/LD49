extends StaticBody2D

export var open_texture: Texture
export var closed_texture: Texture
export var panel_name: String
export var duration: float = 5.0
export var reward: int = 10
export var penalty: float = 3.0

func interact():
	GameManager.interact(panel_name, duration, reward, penalty)
