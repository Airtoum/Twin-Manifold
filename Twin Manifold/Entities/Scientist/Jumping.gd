extends SMState


var agent : Scientist


func state_init():
	agent = state_machine.agent
	
func state_start(from_state):
	agent.velocity.y = agent.jump_speed


func state_physics_process(delta):
	if (agent.input_flags & cons.INPUT_LEFT):
		agent.velocity.x = math.weightedSum(agent.velocity.x, 0.8, -agent.move_speed, 0.2)
	if (agent.input_flags & cons.INPUT_RIGHT):
		agent.velocity.x = math.weightedSum(agent.velocity.x, 0.8, agent.move_speed, 0.2)
	if (agent.is_on_floor()):
		state_machine.set_state("Moving")
		

func state_end(to_state):
	pass
