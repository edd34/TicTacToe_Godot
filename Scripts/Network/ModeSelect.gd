extends OptionButton

onready var selector = get_node(".")
onready var clientModeNode = get_node("../ClientMode")
onready var serverModeNode = get_node("../ServerMode")
var mode

func _ready():
	selector.connect("item_selected",self,"_on_Plus_pressed")
	pass

func _on_Plus_pressed(id):
	if get_item_text(id) == "Client":
		clientModeNode.show()
		serverModeNode.hide()
		mode = "client"
	elif get_item_text(id) == "Server":
		clientModeNode.hide()
		serverModeNode.show()
		mode = "server"
	