extends KinematicBody2D
class_name Player

export var speed: Vector2;

func _physics_process(delta):
	var direction = Vector2(
			Input.get_action_strength("right")-Input.get_action_strength("left"),
			Input.get_action_strength("down")-Input.get_action_strength("up")
	) * speed
	move_and_slide(direction, Vector2.ZERO)
