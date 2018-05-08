extends TextureButton

onready var board = get_tree().get_root().get_node("Node/Script/Board")
onready var parent_node = int(get_parent().name)
onready var label = get_tree().get_root().get_node("Node/UI/Info/Label")

func _on_TextureButton_pressed():
	if (board.state == board.GameState.IN_PROGRESS and \
		!board.isCellValueAlreadySet(parent_node)):
			if board.is_player_currentTurn == board.Player.X :
				get_node("../Sprite").setSprite_X()
			elif board.is_player_currentTurn == board.Player.O :
				get_node("../Sprite").setSprite_O()
			board.mark(parent_node)
			
	if(board.state == board.GameState.FINISHED):
		label.text = "Winner is "+board.getWinner()+" !"
		pass
	else:
		match board.is_player_currentTurn :
			board.Player.X :
				label.text = "Player X turn"
			board.Player.O:
				label.text = "Player O turn"
	pass # replace with function body