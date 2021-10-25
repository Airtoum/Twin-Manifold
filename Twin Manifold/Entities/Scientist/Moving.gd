extends SMState


var agent : Scientist


func state_init():
	agent = state_machine.agent
	
func state_start(from_state):
	agent.play_animation("Run")
	agent.set_collider("Normal")


func state_physics_process(delta):
	agent.snap = Vector2.DOWN
	var i_b_l_r_i = agent.is_both_left_right_input()
	if (agent.input_flags & cons.INPUT_LEFT and not i_b_l_r_i):
		agent.velocity.x = math.approach_exp(delta, agent.velocity.x, -agent.move_speed, agent.move_accel_rate)
	if (agent.input_flags & cons.INPUT_RIGHT and not i_b_l_r_i):
		agent.velocity.x = math.approach_exp(delta, agent.velocity.x, agent.move_speed, agent.move_accel_rate)
	if (not(agent.input_flags & cons.INPUT_SIDE) or i_b_l_r_i):
		agent.velocity.x = math.approach_exp(delta, agent.velocity.x, 0, agent.move_decel_rate)
		if abs(agent.velocity.x) < 34:
			state_machine.set_state("Idle")
	if (agent.is_on_floor() and agent.input_flags & cons.INPUT_DOWN):
		state_machine.set_state("Ducking")
	if (agent.is_on_floor() and agent.input_flags & cons.INPUT_UP):
		state_machine.set_state("Jumping")
	if (not agent.is_on_floor()):
		state_machine.set_state("Falling")

func state_end(to_state):
	pass
