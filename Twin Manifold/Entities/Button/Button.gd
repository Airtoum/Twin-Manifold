extends Area2D


var pressed_by = []
var is_pressed = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_body_entered(body):
	if body is Scientist:
		pressed_by.append(body)
	am_i_pressed()


func _on_Button_body_exited(body):
	if body is Scientist:
		pressed_by.erase(body)
	am_i_pressed()
	
func am_i_pressed():
	var am_i_pressed_now = pressed_by.size() > 0
	if not is_pressed and am_i_pressed_now:
		GameEvents.emit_signal("button_pressed", self)
		$Sprite.visible = false
	if is_pressed and not am_i_pressed_now:
		GameEvents.emit_signal("button_depressed")
		$Sprite.visible = true
	is_pressed = am_i_pressed_now
