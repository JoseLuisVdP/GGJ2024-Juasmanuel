extends Node3D

@onready var timer = $Sparks/Timer

func _ready():
	timer.connect("timeout", func():queue_free())
	timer.start()
	
func _enter_tree():
	$Sparks/Timer.start()

func _process(delta):
	pass
