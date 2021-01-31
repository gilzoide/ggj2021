extends Spatial

# Declare member variables here. Examples:
var order = []
var pushed = []
var solved = false
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var index = 0
	var path = ""
	var cena
	var placa
	for i in range(0,3):
		index = randi() % 6
		order.append(index)
		path = "res://Ilhas/IlhaEstatuas/Placa" + str(index) + ".tscn"
		cena = load(path)
		placa = cena.instance()
		if i == 0:
			placa.translation.z = -4
		elif i == 1:
			placa.translation.z = -1
		else:
			placa.translation.z = 2
		placa.translation.y = 1
		add_child(placa)
	print_debug("Order: " + str(order))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func button_pressed(button: int):
	if !solved:
		if order[pushed.size()] == button:
			pushed.append(button)
		else:
			pushed.clear()
	
		_island_logic()

func _island_logic():
	if pushed.size() == order.size():
		solved = true
