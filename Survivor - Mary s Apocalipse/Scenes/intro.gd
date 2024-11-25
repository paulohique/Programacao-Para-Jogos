extends Node

var next_map_path = GameManager.maps[GameManager.current_map_index]

func _input(event):
	# Verifica se o evento é de pressionar uma tecla ou um botão
	if event is InputEventKey or event is InputEventMouseButton:
		# Muda para a cena "Main.tscn" quando qualquer tecla ou botão for pressionado
		GameManager.current_map_index += 1
		print("Apertou")

		# Atualiza next_map_path com o novo índice
		if GameManager.current_map_index < GameManager.maps.size():
			next_map_path = GameManager.maps[GameManager.current_map_index]
			print("Próxima cena:", next_map_path)

			# Muda para a próxima cena
			get_tree().change_scene_to_file(next_map_path)
