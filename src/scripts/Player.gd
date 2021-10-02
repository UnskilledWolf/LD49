extends KinematicBody2D
class_name Player

enum PlayerFacing {
	up,
	down,
	left,
	right
}

export var speed: Vector2
export var passive_gain:int = 1
var facing = PlayerFacing.down
var can_move = true
var is_holding_item = false

var tmp_work_reward
var tmp_work_penalty
var tmp_item_damage
var tmp_item_texture

func _ready():
	set_process_input(true)
	GameManager.connect("start_work", self, "_on_gm_start_work")
	GameManager.connect("end_work", self, "_on_gm_end_work")
	GameManager.player_node = self

func _input(event):
	# Only accept inputs when the player can also move
	if can_move:
		if Input.is_action_just_pressed("interact"):
			interact()
		
		# Rotate the raycast and set the facing value
		if Input.is_action_pressed("up"):
			facing = PlayerFacing.up
			$RayCast2D.rotation_degrees = 180;
		elif Input.is_action_pressed("down"):
			facing = PlayerFacing.down
			$RayCast2D.rotation_degrees = 0;
		elif Input.is_action_pressed("left"):
			facing = PlayerFacing.left
			$RayCast2D.rotation_degrees = 90;
		elif Input.is_action_pressed("right"):
			facing = PlayerFacing.right
			$RayCast2D.rotation_degrees = -90;

func _process(delta):
	#Update progress bar
	$WorkProgress/VBoxContainer/ProgressBar.value = $WorkTimer.wait_time - $WorkTimer.time_left

func _physics_process(delta):
	var direction = Vector2(
			Input.get_action_strength("right")-Input.get_action_strength("left"),
			Input.get_action_strength("down")-Input.get_action_strength("up")
	) * speed
	
	set_animation(direction)
	
	if can_move:
		move_and_slide(direction, Vector2.ZERO)

func set_animation(direction: Vector2):
	var to_animation = ""
	if direction == Vector2.ZERO:
		if facing == PlayerFacing.up:
			to_animation = "up"
		elif facing == PlayerFacing.down:
			to_animation = "down"
		elif facing == PlayerFacing.left:
			to_animation = "left"
		elif facing == PlayerFacing.right:
			to_animation = "right"
	else:
		if facing == PlayerFacing.up:
			to_animation = "uwalk"
		elif facing == PlayerFacing.down:
			to_animation = "dwalk"
		elif facing == PlayerFacing.left:
			to_animation = "lwalk"
		elif facing == PlayerFacing.right:
			to_animation = "rwalk"
	
	if $Sprite.animation != to_animation:
		$Sprite.animation = to_animation

func interact():
	if($RayCast2D.is_colliding()):
		var hit = $RayCast2D.get_collider()
		print("[Player] Hit " + hit.name)
		hit.interact()

func give_item(texture: Texture, damage: float):
	$Holding.texture = texture
	$Holding.visible = true
	is_holding_item = true
	tmp_item_damage = damage
	tmp_item_texture = texture

func remove_item():
	$Holding.visible = false
	GameManager.remove_reactor_stability(tmp_item_damage)
	is_holding_item = false

func _on_gm_start_work(name: String, duration: float, reward: int, penalty: float):
	can_move = false
	
	if name != "computer" and name != "constructor":
		$WorkTimer.start(duration)
		tmp_work_reward = reward
		tmp_work_penalty = penalty
		$WorkProgress/VBoxContainer/ProgressBar.max_value = duration
		$WorkProgress.visible = true

func _on_gm_end_work(reward: int):
	can_move = true
	
	if reward > 0:
		$CreditGainParticles.amount = reward
		$CreditGainParticles.restart()

func _on_WorkTimer_timeout():
	can_move = true
	$WorkProgress.visible = false
	GameManager.complete_work(tmp_work_reward, tmp_work_penalty)


func _on_PassiveGainTimer_timeout():
	GameManager.add_constructor_credits(passive_gain)
