extends SMState


var agent : Scientist
var dead_timer = 0.0
var unload_time = 2.0


func state_init():
	agent = state_machine.agent

func state_start(from_state):
	#agent.velocity = Vector2.ZERO
	agent.play_animation("Idle")
	agent.set_collider("Normal")
	dead_timer = 0.0


func state_physics_process(delta):
	if dead_timer > unload_time:
		agent.queue_free()
	agent.modulate.a = 1.0 - (dead_timer / 0.1)
	dead_timer += delta

func state_end(to_state):
	pass
