extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var fondo=ColorRect.new()
	fondo.custom_minimum_size=Vector2(1280,720)
	fondo.z_index=-1
	fondo.mouse_filter=Control.MOUSE_FILTER_IGNORE
	
	$VBoxContainer/Button.pressed.connect(func():_on_button_pressed())
	$VBoxContainer/Button2.pressed.connect(func():_on_button2_pressed())
	fondo.modulate=Color(0.0,0.0,0.0,0.3)
	$".".add_child(fondo)
	$"VBoxContainer/Button".z_index=1
	

func _on_button2_pressed():
	get_tree().quit()
	
func _on_button_pressed():
	$".".visible=false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

