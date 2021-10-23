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
	scientist_interact_add(body)


func _on_ScientistInteract_body_exited(body):
	scientist_interact_remove(body)
