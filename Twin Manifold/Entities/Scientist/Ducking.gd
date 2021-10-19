extends SMState


var agent : Scientist


func state_init():
	agent = state_machine.agent

func state_start(from_state):
	#agent.velocity = Vector2.ZERO
	pass


func state_physics_process(delta):
	agent.snap = Vector2.DOWN
	agent.velocity.x = math.approach_exp(delta, agent.velocity.x, 0, agent.move_decel_rate / 3.0)
	if not(agent.input_flags & cons.INPUT_DOWN):
		state_machine.set_state("Idle")
	elif (agent.is_on_floor() and agent.input_flags & cons.INPUT_UP):
		state_machine.set_state("Jumping")
	if (not agent.is_on_floor()):
		state_machine.set_state("Falling")

func state_end(to_state):
	pass
