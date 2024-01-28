extends Control

const MAIN = "res://main.tscn"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var fondo=TextureRect.new()
	fondo.custom_minimum_size=Vector2(1280,720)
	fondo.z_index=-1
	fondo.mouse_filter=Control.MOUSE_FILTER_IGNORE
	fondo.texture=preload("res://escenas/PORTADA-FINALESCALADA.png")
	fondo.modulate=Color(1.0,1.0,1.0,0.7)
	$".".add_child(fondo)
	
	
func _on_button_pressed():
	get_tree().change_scene_to_file(MAIN)



func _on_button_2_pressed():
	get_tree().quit()
