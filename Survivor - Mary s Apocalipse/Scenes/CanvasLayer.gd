extends CanvasLayer

@onready var start_button = $StartButton  # Pegando o botão pela hierarquia

func _ready():
	# Conectando o sinal do botão ao método
	start_button.pressed.connect(_on_start_button_pressed)

# Método que será chamado quando o botão for pressionado
func _on_start_button_pressed():
	# Trocar para a cena principal
	get_tree().change_scene("res://Scenes/Main.tscn")
