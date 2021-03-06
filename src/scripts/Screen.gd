extends Sprite

export var normal_color: Color;
export var danger_color: Color;
export var normal_text: String;
export var danger_text: String;
export var danger_threshhold: float = 10;

var danger_state = false

func _ready():
	$Screen_Inner.modulate = normal_color
	$Light.color = normal_color
	$Control/VBoxContainer/Label.text = normal_text

func _process(delta):
	$Control/VBoxContainer/StabilityBar.value = GameManager.reactor_stability
	
	# Background Color
	if not danger_state and GameManager.reactor_stability < danger_threshhold:
		danger_state = true
		$Screen_Inner.modulate = danger_color
		$Light.color = danger_color
		$Control/VBoxContainer/Label.text = danger_text
	elif danger_state and GameManager.reactor_stability > danger_threshhold:
		danger_state = false
		$Screen_Inner.modulate = normal_color
		$Light.color = normal_color
		$Control/VBoxContainer/Label.text = normal_text
