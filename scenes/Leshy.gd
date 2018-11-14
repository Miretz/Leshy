extends KinematicBody2D

const UP = Vector2(0,-1)
const SPEED = 5 * 96
const GRAVITY = 1200
const JUMP_VELOCITY = -720

var velocity = Vector2(0,0)
var is_grounded
var current_direction = 1

onready var raycasts = $Raycasts

func _ready():
	pass
	
func _physics_process(delta):
	_get_input()
	velocity.y += GRAVITY * delta
	velocity = move_and_slide(velocity, UP)
	is_grounded = _check_is_grounded()
	_update_animation()

func _input(event):
	if Input.is_action_just_pressed("ui_accept") && is_grounded:
		velocity.y = JUMP_VELOCITY
		
func _get_input():
	var left = Input.is_action_pressed("ui_left")
	var right = Input.is_action_pressed("ui_right")
	var move_direction = -int(left) + int(right)
	velocity.x = lerp(velocity.x, SPEED * move_direction, _get_h_weight())
	if move_direction != 0:
		if current_direction != move_direction:
			current_direction = move_direction
			apply_scale(Vector2(-1,1))

func _check_is_grounded():
	for raycast in raycasts.get_children():
		if raycast.is_colliding():
			return true
	return false
	
func _get_h_weight():
	return 0.2 if is_grounded else 0.1

func _update_animation():
	if velocity.x != 0:
		_anim_switch("walk")
	else:
		_anim_switch("idle")
	
func _anim_switch(animation):
	if $anim.current_animation != animation:
		$anim.play(animation)
	


			

