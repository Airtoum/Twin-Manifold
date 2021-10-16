extends Node

class_name SMState

var agent


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
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
