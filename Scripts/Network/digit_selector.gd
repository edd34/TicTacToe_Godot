extends VBoxContainer

onready var myDigit = $Digit

onready var plus = $Plus
onready var minus = $Minus

onready var plus10 = $Plus10
onready var minus10 = $Minus10

onready var plus100 = $Plus100
onready var minus100 = $Minus100

func _ready():
	print(myDigit.name)
	myDigit.text = str(255)

	plus.connect("pressed",self,"_on_Plus_pressed")
	minus.connect("pressed",self,"_on_Minus_pressed")

	plus10.connect("pressed",self,"_on_Plus10_pressed")
	minus10.connect("pressed",self,"_on_Minus10_pressed")

	plus100.connect("pressed",self,"_on_Plus100_pressed")
	minus100.connect("pressed",self,"_on_Minus100_pressed")
	pass

func _on_Plus_pressed():
	if int(myDigit.text) < 255:
		myDigit.text = str(int(myDigit.text)+1)
	pass

func _on_Minus_pressed():
	if int(myDigit.text) > 0:
		myDigit.text = str(int(myDigit.text)-1)
	pass

func _on_Plus10_pressed():
	if int(myDigit.text) <= 245:
		myDigit.text = str(int(myDigit.text)+10)
	pass

func _on_Minus10_pressed():
	if int(myDigit.text) >= 10:
		myDigit.text = str(int(myDigit.text)-10)
	pass

func _on_Plus100_pressed():
	if int(myDigit.text) <= 155:
		myDigit.text = str(int(myDigit.text)+100)
	pass

func _on_Minus100_pressed():
	if int(myDigit.text) >= 100:
		myDigit.text = str(int(myDigit.text)-100)
	pass