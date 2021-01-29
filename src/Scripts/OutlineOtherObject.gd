extends MeshInstance

func _ready() -> void:
	visible = mesh != null

func set_object(object : MeshInstance):
	if object:
		mesh = object.mesh
		global_transform = object.global_transform
		visible = true
	else:
		mesh = null
		visible = false
