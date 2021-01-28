extends KinematicBody

export(float) var speed = 5
export(float) var rotate_speed = 45

onready var animation_player = $AnimationPlayer

func _ready() -> void:
    set_physics_process(true)

func _physics_process(delta: float) -> void:
    var delta_rotation: float = 0
    if Input.is_action_pressed("move_left"):
        delta_rotation += rotate_speed
    if Input.is_action_pressed("move_right"):
        delta_rotation -= rotate_speed
    if delta_rotation:
        rotate_y(deg2rad(delta_rotation * delta))

    var movement: float = 0
    if Input.is_action_pressed("move_front"):
        movement += 1
    if Input.is_action_pressed("move_back"):
        movement -= 1
    if movement:
        move_and_slide(transform.basis.z * movement * speed, Vector3.UP, true)

    if movement:
        animation_player.play("Moving")
