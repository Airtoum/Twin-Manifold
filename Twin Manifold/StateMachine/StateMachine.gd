extends Node

class_name StateMachine

func fuckin_hell(a):
	if a is NodePath:
		return a
	return a.get_path()

#fuck this god DAMN this is obscene
export(NodePath) onready var current_state = get_node(current_state if (current_state is NodePath) else current_state.get_path()) as Node
var state_list = []
var state_name_lookup = {}
#export(NodePath) onready var agent = get_node(agent) # wish I could export what type this was to maximize modularity
# can you override variables when inheriting? if so, override with the type of
# whatever the the state machine is being used by


# turns out build-in functions aren't overridden. This happens before subclass's _ready.
func _ready():
	for child in self.get_children():
		if child is Node:
			state_list.append(child)
			state_name_lookup[child.name] = child
			child.state_machine = self


# Called every frame. 'delta' is the elapsed time since the previous frame.
func state_machine_process(delta):
	current_state.state_process(delta)

func state_machine_physics_process(delta):
	current_state.state_physics_process(delta)


func set_state(name):
	var new_state = state_name_lookup[name]
	if !new_state: # if not null, proceed
		return
	current_state.end_state(new_state)
	new_state.start_state(current_state) # current state hasn't changed yet, hopefully this doesn't raise any unwanted behaviour
	current_state = new_state
	
	
