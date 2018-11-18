extends Node2D

onready var leshy = $Leshy
onready var wolf = $Wolf

onready var controlled_character = leshy

func _ready():
	controlled_character.enable()
	pass
	
func _process(delta):
	if Input.is_action_just_pressed("swap"):
		controlled_character.disable()
		if controlled_character == leshy:
			controlled_character = wolf
		else:
			controlled_character = leshy
		controlled_character.enable()
