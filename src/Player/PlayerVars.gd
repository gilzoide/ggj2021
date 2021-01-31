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

const coin_caminho = preload("res://Models/ReadyToUse/CoinCaminho.tscn")
const coin_escura = preload("res://Models/ReadyToUse/CoinEscura.tscn")
const coin_estatua = preload("res://Models/ReadyToUse/CoinEstatua.tscn")

var coin_scene = {
	Ilha.IlhaCaminho: coin_caminho,
	Ilha.IlhaEscura: coin_escura,
	Ilha.IlhaEstatua: coin_estatua,
}

func set_ilha_done(i : int) -> void:
	ilha_done[i] = true


func is_all_done() -> bool:
	return ilha_done[Ilha.IlhaCaminho] and ilha_done[Ilha.IlhaEscura] and ilha_done[Ilha.IlhaEstatua]
