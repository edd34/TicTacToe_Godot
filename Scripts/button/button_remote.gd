extends TextureButton

onready var board = get_tree().get_root().get_node("Node/Script/Board")
onready var parent_node = int(get_parent().name)
onready var label = get_tree().get_root().get_node("Node/UI/Info/Label")
onready var PlayCross_node = get_tree().get_root().get_node("Node/SFX/PlayCross")
onready var PlayCircle_node = get_tree().get_root().get_node("Node/SFX/PlayCircle")
onready var PlayWin_node = get_tree().get_root().get_node("Node/SFX/Win")
onready var PlayLose_node = get_tree().get_root().get_node("Node/SFX/Lose")
onready var PlayDraw_node = get_tree().get_root().get_node("Node/SFX/Lose")

onready var your_pattern

func _ready():
	print("node",PlayCross_node)
	print("status =",get_node("/root/global_network").my_network_status)
	if get_node("/root/global_network").my_network_status == 1:
		your_pattern = board.Player.X
		PlayCross_node.play()
		label.text = "It's your turn, your are X"
	elif get_node("/root/global_network").my_network_status == 2:
		your_pattern = board.Player.O
		PlayCircle_node.play()
		label.text = "Wait for the opponent, your are O"
	print("your pattern "+str(your_pattern))
	pass

func _on_TextureButton_pressed():
	print("parent_node",parent_node)
	print(get_node("../Sprite"))
	#if board.state != board.GameState.FINISHED:
	if board.player_currentTurn == your_pattern:
		rpc("play")
	pass # replace with function body
	
sync func play():
	if board.state == board.GameState.IN_PROGRESS and \
	!board.isCellValueAlreadySet(parent_node):
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
		print("Draw")
	elif board.state == board.GameState.FINISHED :
		match board.player_currentTurn :
			your_pattern :
				label.text = "You won "+board.getWinner()+" !"
				PlayWin_node.play()
			_ :
				label.text = "You loose"
				PlayLose_node.play()
		pass
	else:
		match board.player_currentTurn :
			your_pattern :
				label.text = "It's your turn"
			_ :
				label.text = "Wait for the opponent"
			
			
		#match board.player_currentTurn :
		#	your_pattern :
		#		label.text = "It is your turn, you are "+str(your_pattern)
		#	_ :
		#		label.text = "Wait for the opponent"
	pass
	
sync func disconnect_game():
	get_tree().set_network_peer(null)
	pass
	
sync func goto_main_menu():
	get_node("/root/global").goto_scene("res://Scenes/MainMenu.tscn")
	pass