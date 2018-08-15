extends Button

onready var PopupMenu_newGame = get_tree().get_root().get_node("Node/MarginContainer/CenterContainer/PopupMenu")
onready var Dialog = get_tree().get_root().get_node("Node/MarginContainer/CenterContainer/Dialog")

func show_Popup_NewGame():
	PopupMenu_newGame.popup()
	PopupMenu_newGame.set_position(Vector2(338,370))
	pass

func _on_NewGameButton_pressed():
	show_Popup_NewGame()
	pass


func _on_PopupMenu_index_pressed(index):
		match PopupMenu_newGame.get_item_text(index):
			"One Player":
				get_node("/root/global").goto_scene("res://Scenes/OnePlayer.tscn")
				pass
			"Two Player":
				get_node("/root/global").goto_scene("res://Scenes/TwoPlayer.tscn")
				pass
			"Remote Player":
				get_node("/root/global").goto_scene("res://Scenes/Network_Settings.tscn")
				pass
			"Cancel":
				PopupMenu_newGame.hide()
				pass


func _on_Dialog_confirmed():
	Dialog.hide()
	show_Popup_NewGame()
	pass # replace with function body
