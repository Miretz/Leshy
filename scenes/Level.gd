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
			wolf.position = Vector2(leshy.position)
			wolf.position.y += 156
			controlled_character = wolf
		else:
			leshy.position = Vector2(wolf.position)
			controlled_character = leshy
		controlled_character.enable()
