extends KinematicBody2D


class_name Scientist

var velocity = Vector2.ZERO
var snap = Vector2.ZERO
export var normal_gravity = Vector2.DOWN * 1700.4
export var jump_gravity : Vector2 = normal_gravity #Vector2.DOWN * 900.4
var gravity = normal_gravity
export(int, FLAGS, "Left", "Right", "Up", "Down", "Clone") var input_flags
export(NodePath) onready var state_machine = get_node(state_machine) as StateMachine
export(float) var move_speed = 230.0
export(float) var jump_speed = 620 #420.0
export(float) var move_accel_rate = 0.000001 # per second, reciprocal
export(float) var move_decel_rate = 0.0001 # per second, reciprocal
export(float) var coyote_time_limit = 0.08
export(bool) var facing_left = false
var starting_state = null

export(PackedScene) onready var Clone
export(NodePath) onready var graphic = get_node(graphic) as Sprite

const INPUT_LEFT = 1
const INPUT_RIGHT = 2
const INPUT_UP = 4
const INPUT_DOWN = 8
# use "if input_flags & INPUT_UP to check. in that case it will always return 0 or 4

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Scientist")
	
func do_starting_state():
	if starting_state:
		state_machine.set_state(starting_state)
		print("Starting state was " + starting_state + ", current state is " + state_machine.current_state_name)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_facing_left()
	graphic.flip_h = not facing_left

# Subclass physics process happens first before superclass
func _physics_process(delta):
	state_machine.state_machine_physics_process(delta)
	velocity += gravity * delta
	#print(state_machine.current_state.name)
	#print(is_on_floor())
	velocity = move_and_slide_with_snap(velocity, snap, Vector2.UP)
	check_and_spawn_clone()
	self.input_flags &= cons.INPUT_HOLD # turn off clone/jump input


func set_facing_left():
	if (self.input_flags & cons.INPUT_LEFT and not self.input_flags & cons.INPUT_RIGHT):
		facing_left = true
	if (not self.input_flags & cons.INPUT_LEFT and self.input_flags & cons.INPUT_RIGHT):
		facing_left = false
		
func is_both_left_right_input():
	return input_flags & cons.INPUT_SIDE == cons.INPUT_SIDE
		
func check_and_spawn_clone():
	if self.input_flags & cons.INPUT_CLONE:
		print("CLONING")
		var clone = Clone.instance()
		print(clone)
		get_parent().add_child(clone)
		clone.position = self.position
		if clone.is_in_group("Scientist"):
			clone.velocity = self.velocity
			clone.facing_left = self.facing_left
			clone.starting_state = self.state_machine.current_state_name
			clone.do_starting_state()
			print(self.state_machine.current_state_name)
			match self.state_machine.current_state_name:
				"Idle":
					clone.input_flags = cons.INPUT_NONE
				"Moving":
					clone.input_flags = self.input_flags & cons.INPUT_SIDE
				"Jumping":
					clone.input_flags = cons.INPUT_UP
					clone.input_flags |= cons.INPUT_LEFT if facing_left else cons.INPUT_RIGHT
				"Falling":
					clone.starting_state = "Jumping"
					clone.input_flags = cons.INPUT_UP
					clone.input_flags |= cons.INPUT_LEFT if facing_left else cons.INPUT_RIGHT
				"Ducking":
					clone.input_flags = cons.INPUT_DOWN
