extends OptionButton

onready var selector = get_node(".")



func _ready():
	selector.connect("item_selected",self,"_on_Plus_pressed")
	pass

func _on_Plus_pressed(id):
	print("ID = "+String(id))
	pass