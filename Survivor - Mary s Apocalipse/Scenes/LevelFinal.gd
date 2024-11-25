extends Node

func _ready():
	# Inicia o diálogo automaticamente quando o jogo começa
	Dialogic.start("final")
	
	# Desabilita inputs do jogo enquanto o diálogo está ativo
	set_process_input(false)

func _input(event: InputEvent):
	# Impede que qualquer entrada seja processada se um diálogo estiver ativo
	if Dialogic.current_timeline != null:
		return

	# Processa apenas entradas específicas (exemplo de ENTER aqui)
	if event is InputEventKey and event.keycode == KEY_ENTER and event.pressed:
		print("Diálogo já foi concluído. Continue o jogo.")  # Ou outra lógica de jogo

# Checa se o diálogo terminou
func _process(delta):
	if Dialogic.current_timeline == null and not is_processing_input():
		# Reativa inputs quando o diálogo termina
		set_process_input(true)
		print("O diálogo terminou. O jogo pode começar agora!")
