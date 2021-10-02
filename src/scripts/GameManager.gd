extends Node

var reactor_stability: float = 100
var constructor_credits: int = 0

func remove_reactor_stability(change: float):
	# Removes, but is clamped between 0 and 100
	reactor_stability = min(max(reactor_stability - change ,0), 100)

func add_constructor_credits(change: int):
	# Add the change, but does not go negative
	constructor_credits = max(constructor_credits + change, 0)

func interact(name: String, duration: float, reward: int, penalty: float):
	print("[Game Manager] Interacting with panel " + name)
	# TODO move to after the thing is done
	remove_reactor_stability(-penalty) # Actually add, because minux negative is positive
	add_constructor_credits(reward)
