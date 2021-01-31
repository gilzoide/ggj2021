extends CollisionObject

signal interact()
signal start_interactable()
signal stop_interactable()

export(bool) var should_be_enabled = false
export(Color) var emission_color = Color.green
export(Color) var disabled_emission_color = Color.black
onready var interactable_color = lerp(emission_color, disabled_emission_color, 0.5)

onready var material : SpatialMaterial = $MeshInstance.material_override
var is_enabled = true

func _ready() -> void:
	connect("interact", self, "toggle_emission")
	connect("start_interactable", self, "set_emission_interactable", [true])
	connect("stop_interactable", self, "set_emission_interactable", [false])

func toggle_emission():
	is_enabled = !is_enabled
	update_color()

func update_color():
	if is_enabled:
		material.emission = emission_color
	else:
		material.emission = Color.black

func set_emission_interactable(interactable : bool) -> void:
	if interactable:
		material.emission = interactable_color
	else:
		update_color()

func is_success() -> bool:
	return (is_enabled and should_be_enabled) or (not is_enabled and not should_be_enabled)

func disable_collisions() -> void:
	$CollisionShape.disabled = true
