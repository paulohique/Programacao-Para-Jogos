extends Node

var maps = ["res://Scenes/main.tscn", "res://Scenes/Level2.tscn", "res://Scenes/Level3.tscn", "res://Scenes/LevelFinal.tscn"]
var current_map_index = 0

# Variável para controlar se o diálogo já foi concluído
var dialogo_concluido = false

# Variável para verificar se o jogo está pausado para diálogo
var jogo_pausado_para_dialogo = false

func _ready():
	# Inicia o diálogo automaticamente ao começar o jogo
	iniciar_dialogo("introducao")

func iniciar_dialogo(timeline: String):
	if not dialogo_concluido:
		Dialogic.start(timeline)
		# Pausa o jogo enquanto o diálogo está ativo
		set_jogo_pausado(true)

func _input(event: InputEvent):
	# Previne qualquer entrada enquanto o diálogo está ativo
	if jogo_pausado_para_dialogo:
		if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
			event.consume()  # Previne ações como disparos
		return

func _process(delta):
	# Monitora o estado do diálogo e reativa o jogo ao término
	if Dialogic.current_timeline == null and jogo_pausado_para_dialogo:
		set_jogo_pausado(false)
		dialogo_concluido = true
		print("O diálogo terminou. O jogo pode continuar.")

func set_jogo_pausado(pausado: bool):
	jogo_pausado_para_dialogo = pausado
	# Pausa todos os nós no jogo, exceto os que gerenciam diálogos
	for node in get_tree().get_nodes_in_group("pausavel"):
		if pausado:
			node.set_physics_process(false)
			node.set_process(false)
		else:
			node.set_physics_process(true)
			node.set_process(true)

# Opcional: Método chamado quando o jogador morre
func ao_morrer():
	if dialogo_concluido:
		print("Jogador morreu, mas o diálogo não será reiniciado.")
