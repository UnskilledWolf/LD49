extends Control

export var hack_time: float;
export var clean_time: float;
export var game_time: float;

export var hack_reward: int;
export var clean_reward: int;
export var game_reward: int;

func _ready():
	GameManager.connect("start_work", self, "_on_gm_start_work")
	GameManager.connect("end_work", self, "_on_gm_end_work")

func _on_gm_start_work(name: String, duration: float, reward: int, penalty: float):
	if name == "computer":
		self.visible = true

func _on_gm_end_work():
	self.visible = false

func _on_HackButton_pressed():
	self.visible = false
	GameManager.interact("hack", hack_time, hack_reward, 0)

func _on_CleanButton_pressed():
	self.visible = false
	GameManager.interact("clean", clean_time, clean_reward, 0)

func _on_GameButton_pressed():
	self.visible = false
	GameManager.interact("game", game_time, game_reward, 0)

func _on_QuitButton_pressed():
	GameManager.complete_work(0,0)
