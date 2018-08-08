extends Node


func _input(ev):
	if Input.is_key_pressed(KEY_ENTER) or ev is InputEventMouseButton :
		get_node("/root/global").goto_scene("res://Scenes/MainMenu.tscn")