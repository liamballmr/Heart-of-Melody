extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var direction : Vector2
var speed := 300

func _physics_process(delta: float) -> void:
	get_input()
	velocity = direction * speed
	move_and_slide()

func get_input():
	direction = Input.get_vector("move_down", "move_left", "move_right", "move_up")
	print(direction)
