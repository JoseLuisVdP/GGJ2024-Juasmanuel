extends StaticBody3D
class_name ObjetoRompible

@export
var peso:int
@export
var puntuacion:int
signal puntuar
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func getPuntuacion():
	return puntuacion

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
