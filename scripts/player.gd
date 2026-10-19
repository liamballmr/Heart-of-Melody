extends CharacterBody2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var anim_player: AnimationPlayer = $AnimationPlayer
@onready var anim_tree: AnimationTree = $AnimationTree

var move_state_machine: AnimationNodeStateMachinePlayback

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var direction: Vector2
var speed := 300.0

func _ready() -> void:
	move_state_machine = anim_tree.get("parameters/MoveStateMachine/playback")

func _physics_process(delta: float) -> void:
	get_input()
	velocity = direction * speed
	move_and_slide()	
	animation()


func get_input() -> void:
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")

func animation() -> void:
	if direction != Vector2.ZERO:
		move_state_machine.travel('move')
		anim_tree.set("parameters/MoveStateMachine/move/blend_position", direction)
		anim_tree.set("parameters/MoveStateMachine/idle/blend_position", direction)
	else:
		move_state_machine.travel('idle')
