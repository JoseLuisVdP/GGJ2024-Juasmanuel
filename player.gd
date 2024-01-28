extends CharacterBody3D


@export var velocidadBase = 6.0
var velocidad
var velocidadEmbiste = 18.0
@export var sens = 0.4
@onready var camera = $SpringArm3D
@onready var cam3D = $SpringArm3D/Camera3D
@onready var zorrete = $ControlFox
@onready var animaciones = $ControlFox/zorro/AnimationPlayer
@export var explota : PackedScene
var embiste = 2
var inputDir
var direccion = Vector3.ZERO
@onready var tiempoEmbiste = $TimerEmbestida

var anguloAnteriorCamara = -0.7	#valor arbitrario válido


var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	if event is InputEventMouseMotion:
		camera.rotate_x(deg_to_rad(-event.relative.y * sens))
		rotate_y(deg_to_rad(-event.relative.x * sens))
		zorrete.rotate_y(deg_to_rad(event.relative.x * sens))  #para que el zorro no se mueva con la cam
		
		anguloAnteriorCamara = camera.rotation.x
		
func embestida():
	if !embistiendo():	
		tiempoEmbiste.start()
	
func embistiendo():
	return !tiempoEmbiste.is_stopped()

func _process(_delta):
	if camera.rotation.x > -0.2 :
		camera.rotate_x(-0.2 - camera.rotation.x)
	elif camera.rotation.x < -0.9:
		camera.rotate_x(-0.9 - camera.rotation.x)
	

func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	if Input.is_action_just_pressed("correr"):
		embestida()
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()

	velocidad = velocidadEmbiste if embistiendo() else velocidadBase
	inputDir = Input.get_vector("izquierda", "derecha", "arriba", "abajo")
	direccion = (transform.basis * Vector3(inputDir.x, 0, inputDir.y)).normalized()
	if direccion:
		if embistiendo():
			animaciones.play("embestida")
		else:
			animaciones.play("Walking")
			velocity.x = direccion.x * velocidad
			velocity.z = direccion.z * velocidad
			zorrete.look_at(position + direccion)
	else:
		if embistiendo():
			animaciones.play("embestida")
		else:
			animaciones.play("idle")
		
		velocity.x = move_toward(velocity.x, 0, velocidad)
		velocity.z = move_toward(velocity.z, 0, velocidad)

	move_and_slide()
		


func _on_area_3d_body_entered(body):
	if embistiendo():
		if body.is_in_group("destruible"):
			var boom = explota.instantiate()
			add_child(boom, false, INTERNAL_MODE_DISABLED)
			body.emit_signal("puntuar")
			body.queue_free()
