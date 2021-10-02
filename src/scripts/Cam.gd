extends Camera2D

export(NodePath) var target_node

onready var target: Player = get_node(target_node)

func _process(delta):
	self.position.x = target.position.x
