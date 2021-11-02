extends Area2D


var is_lever_pulled = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_body_entered(body):
	if body is Scientist:
		toggle_flipped()


func _on_Button_body_exited(body):
	pass
	
func toggle_flipped():
	is_lever_pulled = not is_lever_pulled
	if is_lever_pulled:
		GameEvents.emit_signal("lever_flipped_on", self)
		GameEvents.emit_signal("activate", self)
		$LeverOff.visible = false
		$LeverOn.visible = true
	else:
		GameEvents.emit_signal("lever_flipped_off", self)
		GameEvents.emit_signal("deactivate", self)
		$LeverOff.visible = true
		$LeverOn.visible = false
