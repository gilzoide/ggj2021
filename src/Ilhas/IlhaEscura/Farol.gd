extends StaticBody

export(float) var rotate_speed = 1
onready var spotlight = $SpotLight
onready var esfera = $Esfera

func _ready() -> void:
	set_process(false)

func liga():
	spotlight.visible = true
	esfera.material_override.emission_enabled = true
	esfera.material_override.emission = spotlight.light_color
	set_process(true)

func _process(delta: float) -> void:
	spotlight.global_rotate(Vector3.UP, delta * rotate_speed)
