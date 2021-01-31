extends Node

var camera_speed : float = 1

enum Ilha {
	Ilha1,
	Ilha2,
	Ilha3,
	Ilha4,
}

var ilha_done = {
	Ilha.Ilha1: false,
	Ilha.Ilha2: false,
	Ilha.Ilha3: false,
	Ilha.Ilha4: false,
}

func set_ilha_done(i : int) -> void:
	ilha_done[i] = true


func is_all_done() -> bool:
	return ilha_done[Ilha.Ilha1] and ilha_done[Ilha.Ilha2] and ilha_done[Ilha.Ilha3] and ilha_done[Ilha.Ilha4]
