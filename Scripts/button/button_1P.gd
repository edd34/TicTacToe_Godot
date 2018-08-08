extends TextureButton

onready var board = get_tree().get_root().get_node("Node/Script/Board")
onready var parent_node = int(get_parent().name)
onready var label = get_tree().get_root().get_node("Node/UI/Info/Label")
onready var PlayCross_node = get_tree().get_root().get_node("Node/SFX/PlayCross")
onready var PlayCircle_node = get_tree().get_root().get_node("Node/SFX/PlayCircle")
onready var PlayWin_node = get_tree().get_root().get_node("Node/SFX/Win")
onready var PlayLose_node = get_tree().get_root().get_node("Node/SFX/Lose")
onready var PlayDraw_node = get_tree().get_root().get_node("Node/SFX/Lose")

func _ready():
	pass

func _on_TextureButton_pressed():
	if (board.state == board.GameState.IN_PROGRESS and \
		!board.isCellValueAlreadySet(parent_node)):
			if board.is_player_currentTurn == board.Player.X :
				get_node("../Sprite").setSprite_X()
				PlayCircle_node.play()
				var t = Timer.new()
				t.set_wait_time(1)
				t.set_one_shot(true)
				self.add_child(t)
				t.start()
				yield(t, "timeout")
				t.queue_free()
			elif board.is_player_currentTurn == board.Player.O :
				get_node("../Sprite").setSprite_O()
				PlayCircle_node.play()
			board.mark(parent_node)
	
	if board.return_available_move().size() == 0 :
		board.state = board.GameState.FINISHED
		label.text = "Draw"
		PlayDraw_node.play()
		print("Draw")
	elif board.state == board.GameState.FINISHED :
		label.text = "Winner is "+board.getWinner()+" !"
		
		match board.getWinner():
			"X":
				PlayWin_node.play()
				pass
				
			"O":
				PlayLose_node.play()
				pass
				
			-1:
				label.text = "Draw"
				print("null")
				pass
		
		pass
	else:
		match board.is_player_currentTurn :
			board.Player.X :
				label.text = "Player X turn"
			board.Player.O:
				label.text = "Player O turn"
	pass # replace with function body