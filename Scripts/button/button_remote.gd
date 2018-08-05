extends TextureButton

onready var board = get_tree().get_root().get_node("Node/Script/Board")
onready var parent_node = int(get_parent().name)
onready var label = get_tree().get_root().get_node("Node/UI/Info/Label")

onready var your_pattern

func _ready():
#	print("status =",get_node("/root/global_network").my_network_status)
#	if get_node("/root/global_network").my_network_status == 1:
#		your_pattern = board.player.X
#	elif get_node("/root/global_network").my_network_status == 2:
#		your_pattern = board.player.O
#	print("your pattern "+str(your_pattern))
	pass

func _on_TextureButton_pressed():
	print("parent_node",parent_node)
	print(get_node("../Sprite"))
	rpc("play")
	pass # replace with function body
	
sync func play():
	if (board.state == board.GameState.IN_PROGRESS and \
	!board.isCellValueAlreadySet(parent_node)):
		if board.player_currentTurn == board.Player.X :
			get_node("../Sprite").setSprite_X()
		elif board.player_currentTurn == board.Player.O :
			get_node("../Sprite").setSprite_O()
		board.mark(parent_node)
		
	if(board.state == board.GameState.FINISHED):
		label.text = "Winner is "+board.getWinner()+" !"
		pass
	else:
		match board.player_currentTurn :
			board.player.X :
				label.text = "It is X's turn"
			board.player.O :
				label.text = "It is O's turn"
	pass