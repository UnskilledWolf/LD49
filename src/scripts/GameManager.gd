extends Node

signal start_work
signal end_work
signal open_constructor
signal game_won

var reactor_stability: float = 100
var constructor_credits: int = 0
var player_node
var countdown_timer: Timer

func _process(delta):
	if reactor_stability <= 0:
		emit_signal("game_won")

func remove_reactor_stability(change: float):
	# Removes, but is clamped between 0 and 100
	reactor_stability = min(max(reactor_stability - change ,0), 100)

func add_constructor_credits(change: int):
	# Add the change, but does not go negative
	constructor_credits = max(constructor_credits + change, 0)

func interact(name: String, duration: float, reward: int, penalty: float):
	print("[Game Manager] Interacting with " + name)
	emit_signal("start_work", name, duration, reward, penalty)

func complete_work(reward: int, penalty: float):
	remove_reactor_stability(-penalty) # Actually add, because minux negative is positive
	add_constructor_credits(reward)
	emit_signal("end_work", reward)

func computer_interact():
	emit_signal("start_work", "computer", 0, 0, 0)

func open_constructor():
	if not player_node.is_holding_item:
		emit_signal("start_work", "constructor", 0, 0, 0)
		emit_signal("open_constructor")

func game_over():
	get_tree().change_scene("res://src/scenes/GameOver.tscn")
