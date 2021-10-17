extends SMState


var agent : Scientist


func state_init():
	agent = state_machine.agent
	
func state_start(from_state):
	pass


func state_physics_process(delta):
	if (agent.input_flags & cons.INPUT_LEFT):
		agent.velocity.x = math.approach_exp(agent.velocity.x, agent.velocity.x, -agent.move_speed, 0.8)
	if (agent.input_flags & cons.INPUT_RIGHT):
		agent.velocity.x = math.approach_exp(agent.velocity.x, agent.velocity.x, agent.move_speed, 0.8)
	if (agent.is_on_floor() and agent.input_flags & cons.INPUT_UP):
		state_machine.set_state("Jumping")
	if (not agent.is_on_floor()):
		state_machine.set_state("Falling")

func state_end(to_state):
	pass
