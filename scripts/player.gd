extends CharacterBody2D

@onready var move_state_machine : AnimationNodeStateMachinePlayback = $AnimationTree.get("parameters/MoveStateMachine/playback") 

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var direction : Vector2
var speed := 300

func _physics_process(delta: float) -> void:
	get_input()
	velocity = direction * speed
	move_and_slide()
	animation()

func get_input():
	direction = Input.get_vector("move_down", "move_left", "move_right", "move_up")
	
func animation():
	if direction:
		print(direction)
		move_state_machine.travel('move')
		var target_vector:Vector2 = Vector2(round(direction.x), round(direction.y))
		$AnimationTree.set("parameters/MoveStateMachine/move/blend_position", target_vector)
		$AnimationTree.set("parameters/MoveStateMachine/idle/blend_position", target_vector)

	else:
		move_state_machine.travel('idle')
