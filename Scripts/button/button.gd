extends TextureButton

onready var board = get_tree().get_root().get_node("Node/Script/Board")
onready var parent_node = int(get_parent().name)
onready var label = get_tree().get_root().get_node("Node/UI/Info/Label")
onready var PlayCross_node = get_tree().get_root().get_node("Node/SFX/PlayCross")
onready var PlayCircle_node = get_tree().get_root().get_node("Node/SFX/PlayCircle")
onready var PlayWin_node = get_tree().get_root().get_node("Node/SFX/Win")
onready var PlayLose_node = get_tree().get_root().get_node("Node/SFX/Lose")
onready var PlayDraw_node = get_tree().get_root().get_node("Node/SFX/Lose")

func _on_TextureButton_pressed():
	if (board.state == board.GameState.IN_PROGRESS and \
	!board.isCellValueAlreadySet(parent_node)):
		if board.player_currentTurn == board.Player.X :
			get_node("../Sprite").setSprite_X()
			PlayCross_node.play()
		elif board.player_currentTurn == board.Player.O :
			get_node("../Sprite").setSprite_O()
			PlayCircle_node.play()
		board.mark(parent_node)
	
	if board.return_available_move().size() == 0 :
		board.state = board.GameState.FINISHED
		label.text = "Draw"
		PlayDraw_node.play()
		
	elif board.state == board.GameState.FINISHED :
		label.text = "Winner is "+board.getWinner()+" !"
		PlayWin_node.play()
		pass
	else:
		match board.player_currentTurn :
			board.Player.X :
				label.text = "Player X turn"
			board.Player.O:
				label.text = "Player O turn"
	pass # replace with function body