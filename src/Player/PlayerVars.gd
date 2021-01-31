extends Node

var camera_speed : float = 1

enum Ilha {
	IlhaCaminho,
	IlhaEscura,
	IlhaEstatua,
}

var ilha_done = {
	Ilha.IlhaCaminho: false,
	Ilha.IlhaEscura: false,
	Ilha.IlhaEstatua: false,
}

func set_ilha_done(i : int) -> void:
	ilha_done[i] = true


func is_all_done() -> bool:
	return ilha_done[Ilha.IlhaCaminho] and ilha_done[Ilha.IlhaEscura] and ilha_done[Ilha.IlhaEstatua]
