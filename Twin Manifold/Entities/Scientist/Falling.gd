extends SMState


var agent : Scientist
var coyote_time = INF

func state_init():
	agent = state_machine.agent
	
func state_start(from_state):
	agent.snap = Vector2.ZERO
	coyote_time = 0.0
	if from_state.name in ["Jumping", "Falling"]:
		coyote_time = INF


func state_physics_process(delta):
	if (agent.input_flags & cons.INPUT_LEFT):
		agent.velocity.x = math.approach_exp(delta, agent.velocity.x, -agent.move_speed, agent.move_accel_rate)
	if (agent.input_flags & cons.INPUT_RIGHT):
		agent.velocity.x = math.approach_exp(delta, agent.velocity.x, agent.move_speed, agent.move_accel_rate)
	if (not(agent.input_flags & cons.INPUT_SIDE)):
		agent.velocity.x = math.approach_exp(delta, agent.velocity.x, 0, agent.move_decel_rate)
	if (agent.is_on_floor()):
		state_machine.set_state("Moving")
	if (coyote_time < agent.coyote_time_limit and agent.input_flags & cons.INPUT_UP):
		print("Coyote Jump! " + str(coyote_time) + " " + str(agent.coyote_time_limit))
		state_machine.set_state("Jumping")
	coyote_time += delta

func state_end(to_state):
	pass
