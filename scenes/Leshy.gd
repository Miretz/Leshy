extends KinematicBody2D

const DIR_RIGHT = 1
const DIR_LEFT = -1
const SPEED = 400

var movedir = Vector2(0,0)
var spritedir = DIR_RIGHT

func _ready():
	pass
	
func _process(delta):
	var left = Input.is_action_pressed("ui_left")
	var right = Input.is_action_pressed("ui_right")
	movedir.x = -int(left) + int(right)
	
	if movedir != Vector2(0,0):
		anim_switch("walk")
		change_direction(DIR_RIGHT if movedir.x > 0 else DIR_LEFT)
	else:
		anim_switch("idle")
	
	var motion = movedir.normalized() * SPEED
	move_and_slide(motion, Vector2(0,0))
	
func change_direction(newdir):
	if spritedir != newdir:
		apply_scale(Vector2(-1, 1))
		spritedir = newdir

func anim_switch(animation):
	if $anim.current_animation != animation:
		$anim.play(animation)
	
			

