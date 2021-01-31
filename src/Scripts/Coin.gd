extends StaticBody


signal interact()
signal start_interactable()
signal stop_interactable()

export(PlayerVars.Ilha) var ilha

export(NodePath) var object_to_outline_path = null
onready var outline_other_object = get_node("/root/OutlineOtherObject")

func set_outline_enabled(enable : bool):
	if enable:
		var object_to_outline = get_node(object_to_outline_path) if object_to_outline_path else null
		if object_to_outline:
			outline_other_object.set_object(object_to_outline)
	else:
		outline_other_object.set_object(null)

func mark_ilha_done() -> void:
	PlayerVars.set_ilha_done(ilha)
	queue_free()
