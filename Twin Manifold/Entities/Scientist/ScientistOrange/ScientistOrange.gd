extends Scientist


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("ScientistOrange")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _physics_process(delta):
	match state_machine.current_state_name:
		"Moving":
			bounce_off_walls()
		"Jumping":
			bounce_off_walls()
		"Falling":
			bounce_off_walls()
			
			
func bounce_off_walls():
	if is_on_wall():
		for i in get_slide_count():
			var coll = get_slide_collision(i)
			if self.input_flags & cons.INPUT_RIGHT and abs(coll.normal.angle_to(Vector2.LEFT)) < PI/8:
				self.input_flags &= cons.N_INPUT_RIGHT
				self.input_flags |= cons.INPUT_LEFT
			if self.input_flags & cons.INPUT_LEFT and abs(coll.normal.angle_to(Vector2.RIGHT)) < PI/8:
				self.input_flags &= cons.N_INPUT_LEFT
				self.input_flags |= cons.INPUT_RIGHT


func _on_ScientistInteract_body_entered(body):
	if self.age < self.no_interact_until_age:
		return
	scientist_interact_add(body)
	if body.is_in_group("Scientist"):
		if body.state_machine.current_state_name == "Idle" and self.state_machine.current_state_name in ["Moving", "Jumping", "Falling"]:
			if not self.facing_left:
				self.input_flags &= cons.N_INPUT_RIGHT
				self.input_flags |= cons.INPUT_LEFT
			else:
				self.input_flags &= cons.N_INPUT_LEFT
				self.input_flags |= cons.INPUT_RIGHT


func _on_ScientistInteract_body_exited(body):
	scientist_interact_remove(body)


func scientist_interact(other):
	if other.is_in_group("Scientist"):
		match other.state_machine.current_state_name:
			"Idle":
				pass
	# also do base interactions
	.scientist_interact(other)
