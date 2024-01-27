extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()
	#$Timer.Time=60s

func _on_timer_timeoyt():
	print("El tiempo se ha acabado")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
