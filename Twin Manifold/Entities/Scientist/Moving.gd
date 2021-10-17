extends SMState


var agent : Scientist


func state_init():
	agent = state_machine.agent
	
func state_start(from_state):
	pass


func state_physics_process(delta):
	agent.snap = Vector2.DOWN
	if (agent.input_flags & cons.INPUT_LEFT):
		agent.velocity.x = math.approach_exp(delta, agent.velocity.x, -agent.move_speed, agent.move_accel_rate)
	if (agent.input_flags & cons.INPUT_RIGHT):
		agent.velocity.x = math.approach_exp(delta, agent.velocity.x, agent.move_speed, agent.move_accel_rate)
	if (not(agent.input_flags & cons.INPUT_SIDE)):
		agent.velocity.x = math.approach_exp(delta, agent.velocity.x, 0, agent.move_decel_rate)
	if (agent.is_on_floor() and agent.input_flags & cons.INPUT_UP):
		state_machine.set_state("Jumping")
	if (not agent.is_on_floor()):
		state_machine.set_state("Falling")

func state_end(to_state):
	pass
