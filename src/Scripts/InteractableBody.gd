extends CollisionObject

const outline_material : ShaderMaterial = preload("res://Materials/Outline3DMaterial.tres")

signal interact()
signal start_interactable()
signal stop_interactable()

func set_outline_enabled(enable : bool):
	outline_material.set_shader_param("enable", enable)
