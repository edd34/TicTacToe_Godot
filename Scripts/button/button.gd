extends TextureButton

onready var class_board = get_node("../../../model/board")
onready var parent_node = get_parent()

var player_turn = "Player turn : X"
var player_winner = ""


func _on_TextureButton_pressed():
	print("pressed")
	if class_board.state == class_board.GameState.IN_PROGRESS :
		if class_board.player_currentTurn == class_board.Player.X :
			get_node("../Sprite").setSprite_X()
			get_node("../../../UI/player_turn").text = "player turn = O"
		if class_board.player_currentTurn == class_board.Player.O:
			get_node("../Sprite").setSprite_O()
			get_node("../../../UI/player_turn").text = "player turn = X"
		class_board.mark(int(parent_node.name))
		
	class_board.print_board()
	pass # replace with function body