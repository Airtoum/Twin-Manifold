extends SMState


var agent : Scientist
var dead_timer = 0.0
var unload_time = 2.0
var anim_time = 0.1
var death_radians = PI/4


func state_init():
	agent = state_machine.agent

func state_start(from_state):
	#agent.velocity = Vector2.ZERO
	agent.play_animation("Die")
	agent.set_collider("Normal")
	dead_timer = 0.0


func state_physics_process(delta):
	if dead_timer > unload_time:
		agent.queue_free()
	agent.modulate.a = 1.0 - (dead_timer / anim_time)
	agent.rotation = pow(dead_timer / anim_time, 2) * death_radians
	dead_timer += delta

func state_end(to_state):
	pass
