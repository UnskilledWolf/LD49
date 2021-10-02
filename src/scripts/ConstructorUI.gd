extends Control

export(Array, int) var prices = [1,5,10,25,50]
export(Array, Texture) var textures: = []
export(Array, float) var damage = [];

func _ready():
	GameManager.connect("open_constructor", self, "_on_gm_open_constructor")
	GameManager.connect("end_work", self, "_on_gm_end_work")

func buy(id: int):
	if GameManager.constructor_credits >= prices[id]:
		GameManager.constructor_credits -= prices[id]
		GameManager.player_node.give_item(textures[id], damage[id])
		
	GameManager.complete_work(0,0)

func _on_gm_open_constructor():
	$CenterContainer/PanelContainer/VBoxContainer/CreditsContainer/CreditAmount.text = String(GameManager.constructor_credits)
	self.visible = true

func _on_gm_end_work(_reward):
	self.visible = false

func _on_CloseButton_pressed():
	GameManager.complete_work(0,0)
	self.visible = false

func _on_Snack_pressed():
	buy(0)

func _on_Food_pressed():
	buy(1)

func _on_Wrench_pressed():
	buy(2)

func _on_Cable_pressed():
	buy(3)

func _on_Antimater_pressed():
	buy(4)
