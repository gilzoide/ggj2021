extends KinematicBody

const INTERACTABLE_COLLISION_BIT = 2

enum Ilha {
	IlhaCaminho,
	IlhaEscura,
	IlhaEstatua,
	IlhaCentral,
}

export(Ilha) var ilha
export(float) var speed = 5
export(float) var rotate_speed = 45
export var gravity = Vector3.DOWN * 10
export(float) var coin_distance = 2
var velocity = Vector3.ZERO
var mouse_sensitivity = 0.002

onready var camera = $Pivot/Camera

var focused_interactable_object : Node = null
onready var animation_player = $AnimationPlayer

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	set_process_input(true)
	set_physics_process(true)

func _physics_process(delta: float) -> void:
	velocity += gravity * delta
	get_input(delta)
	velocity = move_and_slide(velocity, Vector3.UP, true)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x * mouse_sensitivity * PlayerVars.camera_speed)
		$Pivot.rotate_x(event.relative.y * mouse_sensitivity * PlayerVars.camera_speed)
		$Pivot.rotation.x = clamp($Pivot.rotation.x, -1.2, 1.2)
	
	if event.is_action_pressed("camera_sensitivity_down"):
		mouse_sensitivity /= 5
		print("Camera sensitivity: " + str(mouse_sensitivity))
	
	if event.is_action_pressed("camera_sensitivity_up"):
		mouse_sensitivity *= 5
		print("Camera sensitivity: " + str(mouse_sensitivity))
	
	if event.is_action_pressed("interact", false):
		try_interact()
	
	if event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().paused = true
		$Pause_Screen.show()

func get_input(_delta):
	var vy = velocity.y
	var animate: bool = false
	velocity = Vector3.ZERO
	if Input.is_action_pressed("move_front"):
		velocity -= camera.global_transform.basis.z * speed
		animate = true
	if Input.is_action_pressed("move_back"):
		velocity += camera.global_transform.basis.z * speed
		animate = true
	if Input.is_action_pressed("move_left"):
		velocity -= camera.global_transform.basis.x * speed
		animate = true
		#delta_rotation += rotate_speed
	if Input.is_action_pressed("move_right"):
		velocity += camera.global_transform.basis.x * speed
		animate = true
		#delta_rotation -= rotate_speed

	velocity.y = vy

	if animate:
		animation_player.play("Moving")

func try_interact():
	if focused_interactable_object and focused_interactable_object.has_signal("interact"):
		focused_interactable_object.emit_signal("interact")

func focus_object(body : Node) -> void:
	if focused_interactable_object:
		unfocus_object(body)
	focused_interactable_object = body
	if focused_interactable_object.has_signal("start_interactable"):
		focused_interactable_object.emit_signal("start_interactable")

func unfocus_object(_body : Node) -> void:
	if focused_interactable_object.has_signal("stop_interactable"):
		focused_interactable_object.emit_signal("stop_interactable")
	focused_interactable_object = null

func _on_InteractArea_body_entered(body: PhysicsBody) -> void:
	if body.get_collision_layer_bit(INTERACTABLE_COLLISION_BIT):
		focus_object(body)

func _on_InteractArea_body_exited(body: PhysicsBody) -> void:
	if body == focused_interactable_object:
		unfocus_object(body)

func spawn_coin() -> void:
	var coin : Spatial = PlayerVars.coin_scene[ilha].instance()
	coin.global_transform = global_transform.translated(Vector3.BACK * coin_distance)
	get_tree().root.call_deferred("add_child", coin)
