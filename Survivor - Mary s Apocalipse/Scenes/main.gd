extends Node

# Variável para controlar se o diálogo já foi concluído
var dialogo_concluido = false

func _ready():
	# Inicia o diálogo automaticamente ao começar o jogo
	if not dialogo_concluido:
		Dialogic.start("main")
		# Desabilita inputs do jogo enquanto o diálogo está ativo
		set_process_input(false)
		# Congela todos os nós filhos do jogo

func _input(event: InputEvent):
	# Impede processar entradas enquanto o diálogo estiver ativo
	if Dialogic.current_timeline != null:
		# Verifica se o clique esquerdo é para passar o diálogo
		if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
			event.consume()  # Evita que ações de jogo sejam processadas
		return  # Bloqueia qualquer outra entrada

	# Processa entradas quando o diálogo termina
	if event is InputEventKey and event.keycode == KEY_ENTER and event.pressed:
		print("Diálogo já foi concluído. Continue o jogo.")  # Exemplo de lógica adicional

func _process(delta):
	# Reativa os inputs e descongela o jogo quando o diálogo termina
	if Dialogic.current_timeline == null and not is_processing_input():
		set_process_input(true)
		if not dialogo_concluido:
			print("O diálogo terminou. O jogo pode começar agora!")
		dialogo_concluido = true



# Opcional: Chamar esta função ao morrer para evitar reiniciar o diálogo
func ao_morrer():
	if dialogo_concluido:
		print("Jogador morreu, mas o diálogo não será reiniciado.")
		return
