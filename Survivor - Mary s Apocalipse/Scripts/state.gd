extends Node
class_name State

var state_machine = null
@onready var video_player = $VideoStreamPlayer  # Seu nó VideoPlayer
@onready var start_button = $StartButton  # Caso tenha um botão para iniciar


func _input(event):
	# Detecta qualquer tecla ou clique para iniciar a próxima cena
	if event is InputEventKey or event is InputEventMouseButton:
		_on_start_button_pressed()

func _on_start_button_pressed():
	# Trocar para a cena principal (Main)
	get_tree().change_scene_to_file("res://Scenes/main.gd")

