extends KinematicBody2D


class_name Scientist

var velocity = Vector2.ZERO
var snap = Vector2.ZERO
export var normal_gravity = Vector2.DOWN * 1700.4
export var jump_gravity : Vector2 = normal_gravity #Vector2.DOWN * 900.4
var gravity = normal_gravity
export(int, FLAGS, "Left", "Right", "Up", "Down") var input_flags
export(NodePath) onready var state_machine = get_node(state_machine) as StateMachine
export(float) var move_speed = 200.0
export(float) var jump_speed = 620 #420.0
export(float) var move_accel_rate = 0.000001 # per second, reciprocal
export(float) var move_decel_rate = 0.0001 # per second, reciprocal
export(float) var coyote_time_limit = 0.08
export(bool) var facing_left = false

export(NodePath) onready var graphic = get_node(graphic) as Sprite

const INPUT_LEFT = 1
const INPUT_RIGHT = 2
const INPUT_UP = 4
const INPUT_DOWN = 8
# use "if input_flags & INPUT_UP to check. in that case it will always return 0 or 4

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_facing_left()
	graphic.flip_h = not facing_left


func _physics_process(delta):
	state_machine.state_machine_physics_process(delta)
	velocity += gravity * delta
	#print(state_machine.current_state.name)
	#print(is_on_floor())
	velocity = move_and_slide_with_snap(velocity, snap, Vector2.UP)


func set_facing_left():
	if (self.input_flags & cons.INPUT_LEFT and not self.input_flags & cons.INPUT_RIGHT):
		facing_left = true
	if (not self.input_flags & cons.INPUT_LEFT and self.input_flags & cons.INPUT_RIGHT):
		facing_left = false
