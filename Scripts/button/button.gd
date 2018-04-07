extends TextureButton

onready var board = get_node("/root/Board")
onready var parent_node = int(get_parent().name)

func _on_TextureButton_pressed():
	if (board.state == board.GameState.IN_PROGRESS and 
	!board.isCellValueAlreadySet(parent_node)):
		if board.player_currentTurn == board.Player.X :
			get_node("../Sprite").setSprite_X()
		elif board.player_currentTurn == board.Player.O :
			get_node("../Sprite").setSprite_O()
		board.mark(parent_node)
		board.debug_print()
	pass # replace with function body