extends Node

class_name SMState

var state_machine # pretend this is typed as StateMachine but Godot is dumb
# var agent
# construct this var when inheriting from this, with the specific type you want


# Use this to copy agent from parent StateMachine
func state_init():
	pass
	
# To be overridden, if desired. Happens on state start once.
func state_start(state_from):
	pass

# Called every frame, if StateMachine's current state is this. Override this.
func state_process(delta):
	pass

# For physics, if StateMachine's current state is this. Override this.
func state_physics_process(delta):
	pass

# Override if you want. Happens on state end.
func state_end(state_to):
	pass
