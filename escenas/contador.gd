extends Control

var score = 0
var tiempo = 100
# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()
	for i in get_tree().get_nodes_in_group("destruible"):
		var objeto = i as ObjetoRompible
		objeto.connect("puntuar", func():aumentarPuntitos())
		
func aumentarPuntitos():
	if tiempo > 0:
		
		score += 100
		$VBoxContainer/Label3.set_text(str(score))

func _on_timer_timeoyt():
	print("El tiempo se ha acabado")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if tiempo <= 0:
		$VBoxContainer/HBoxContainer/Label2.set_text("¡¡¡SE ACABÓ!!!")


func _on_timer_timeout():
	if tiempo > 0:
		
		tiempo -= 1
		$VBoxContainer/HBoxContainer/Label2.set_text(str(tiempo))
