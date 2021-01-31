extends Node

signal win_condition_met()

var emojis : Array = []

func _ready() -> void:
	emojis = get_tree().get_nodes_in_group("Emojis")
	for e in emojis:
		e.connect("interact", self, "update")
		connect("win_condition_met", e, "disable_collisions")

func update():
	for e in emojis:
		if not e.is_success():
			return
	emit_signal("win_condition_met")

func print_teste():
	assert(false, "GANHOU")
