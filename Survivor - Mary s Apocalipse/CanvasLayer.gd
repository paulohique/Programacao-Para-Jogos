extends Node

# Timer para contar os 20 segundos
var timer = 18

func _ready():
	# Inicia a contagem regressiva
	set_process(true)

func _process(delta):
	# Diminui o timer a cada quadro
	timer -= delta
	if timer <= 0:
		# Após 20 segundos, ativa a escuta do clique
		set_process_input(true)
		get_tree().quit()

func _input(event):
	# Verifica se o evento é de pressionar uma tecla ou um botão
	if event is InputEventKey or event is InputEventMouseButton:
		get_tree().quit()
