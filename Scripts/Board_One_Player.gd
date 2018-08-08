extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

enum GameState {IN_PROGRESS, FINISHED }
var state = GameState.IN_PROGRESS

enum Player {X=1, O=2}

var Cells = [0,0,0,0,0,0,0,0,0]



var player_winner = -1
var is_player_currentTurn = null

func return_available_move():
	var available = []
	for i in range(9):
		if Cells[i] == 0 :
			available.append(i)
			pass
		pass
	print("available move =",available)
	return available
	pass


func AI_choose_random_move():
	var moves = return_available_move()
	print("moves size = ",moves.size())
	if moves.size() > 0:
		randomize()
		return moves[randi() % moves.size()]
		pass
	pass

func get_sprite_node(index):
	var AI_sprite = get_tree().get_root().get_node("Node/grid/"+String(index)+"/Sprite")
	return AI_sprite
	pass

func AI_set_sprite(index):
	get_sprite_node(index).setSprite_O()
	pass

func print_board():
	print(" ", Cells[0]," ",Cells[1]," ",Cells[2])
	print(" ", Cells[3]," ",Cells[4]," ",Cells[5])
	print(" ", Cells[6]," ",Cells[7]," ",Cells[8])
	pass

func getWinner():
	if(player_winner == Player.X):
		return "X"
	else:
		return "O"
	pass
	
func clearCells():
	for i in range(9):
		Cells[i]=0
	pass

func isValid(index):
	if(state == GameState.FINISHED):
		return false
	elif(isOutOfBound(index)):
		return false
	else :
		return true
	pass

func isOutOfBound(index):
	return (index < 0 || index > 8)

func isCellValueAlreadySet(index):
	return Cells[index] != 0

func isWinningMoveByPlayer(player):
	if(Cells[0] == player && Cells[1] == player && Cells[2] == player):
		return true
	elif(Cells[3] == player && Cells[4] == player && Cells[5] == player):
		return true
	elif(Cells[6] == player && Cells[7] == player && Cells[8] == player):
		return true
	elif(Cells[0] == player && Cells[3] == player && Cells[6] == player):
		return true
	elif(Cells[1] == player && Cells[4] == player && Cells[7] == player):
		return true
	elif(Cells[2] == player && Cells[5] == player && Cells[8] == player):
		return true
	elif(Cells[0] == player && Cells[4] == player && Cells[8] == player):
		return true
	elif(Cells[2] == player && Cells[4] == player && Cells[6] == player):
		return true
	else:
		return false
	
	pass
			
func flipCurrentTurn():
	if is_player_currentTurn == Player.X :
		is_player_currentTurn = Player.O
		var AI_choice = AI_choose_random_move()
		mark(AI_choice)
		AI_set_sprite(AI_choice)
		print("debug AI has played = "+String(AI_choice))
	else:
		is_player_currentTurn = Player.X
	pass
	
func mark_row_col(index):
	if(isValid(index)):
		Cells[index] = is_player_currentTurn
		if(isWinningMoveByPlayer(is_player_currentTurn)):
			state = GameState.FINISHED
			player_winner = is_player_currentTurn
			#get_node("../../UI/player_turn").text = ""
			if player_winner == Player.X :
				#get_node("../../UI/Winner").text = "Winner = player X"
				print("winner = 1")
			else:
				print("winner = 2")
				#get_node("../../UI/Winner").text = "Winner = player O"
			
		else:
			if return_available_move().size() > 0 :
				flipCurrentTurn()
			
func mark(pos):
	mark_row_col(pos)
	pass	

func _ready():
	clearCells()
	player_winner = null
	is_player_currentTurn = Player.X
	state = GameState.IN_PROGRESS
	print_board()
	# Initialization here
	pass

func debug_print():
	print("current_turn ",is_player_currentTurn)
	print_board()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
