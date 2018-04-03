extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

enum GameState {IN_PROGRESS, FINISHED }
var state = GameState.IN_PROGRESS

enum Player {X=1, O=2}

var Cells = [0,0,0,0,0,0,0,0,0]



var player_winner = -1
var player_currentTurn = null

func print_board():
	print(" ", Cells[0]," ",Cells[1]," ",Cells[2])
	print(" ", Cells[3]," ",Cells[4]," ",Cells[5])
	print(" ", Cells[6]," ",Cells[7]," ",Cells[7])
	pass

func getWinner():
	return player_winner

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
	return (index >= 0 && index <= 8)

func isCellValueAlreadySet(index):
	return Cells[index] != 0

func isWinningMoveByPlayer(player):
	if(Cells[0] == player && Cells[1] == player && Cells[2] == player):
		return [player,0]
	elif(Cells[3] == player && Cells[4] == player && Cells[5] == player):
		return [player,1]
	elif(Cells[6] == player && Cells[7] == player && Cells[8] == player):
		return [player,2]
	elif(Cells[0] == player && Cells[3] == player && Cells[6] == player):
		return [player,3]
	elif(Cells[1] == player && Cells[4] == player && Cells[7] == player):
		return [player,4]
	elif(Cells[2] == player && Cells[5] == player && Cells[8] == player):
		return [player,5]
	elif(Cells[0] == player && Cells[4] == player && Cells[8] == player):
		return [player,6]
	elif(Cells[2] == player && Cells[4] == player && Cells[6] == player):
		return [player,7]
	else:
		return [0,-1]
	
	pass
			
func flipCurrentTurn():
	if(player_currentTurn == Player.X):
		player_currentTurn = Player.O
	else:
		player_currentTurn = Player.X
	
func mark_row_col(index):
	print("mark row col")
	if(isValid(index)):
		Cells[index] = player_currentTurn
		if(isWinningMoveByPlayer(player_currentTurn,index)):
			state = GameState.FINISHED
			player_winner = player_currentTurn
			get_node("../../UI/player_turn").text = ""
			if player_winner == Player.X :
				get_node("../../UI/Winner").text = "Winner = player X"
			else:
				get_node("../../UI/Winner").text = "Winner = player O"
			pass
		else:
			flipCurrentTurn()
			
func mark(pos):
	mark_row_col(pos-1)
	pass	

func _ready():
	clearCells()
	player_winner = null
	player_currentTurn = Player.X
	state = GameState.IN_PROGRESS
	print_board()
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
