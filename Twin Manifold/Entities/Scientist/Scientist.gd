extends KinematicBody2D


class_name Scientist

var velocity = Vector2.ZERO
var snap = Vector2.ZERO
export var gravity = Vector2.DOWN * 4
export(int, FLAGS, "Left", "Right", "Up", "Down") var input_flags
export(NodePath) onready var state_machine = get_node(state_machine) as StateMachine
export(float) var move_speed = 4.0

const INPUT_LEFT = 1
const INPUT_RIGHT = 2
const INPUT_UP = 4
const INPUT_DOWN = 8
# use "if input_flags & INPUT_UP to check. in that case it will always return 0 or 4

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _physics_process(delta):
	state_machine.state_machine_physics_process(delta)
	velocity += gravity
	print(state_machine.current_state.name)
	velocity = move_and_slide_with_snap(velocity, snap, Vector2.UP)