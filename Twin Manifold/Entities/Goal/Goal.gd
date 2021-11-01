extends Area2D


var animation_start = false;
var animation_timer = 0
var screwdriver_insert_time = 0.1
var screw_spin_start = 0.5
var total_spin_time = 0.8
var fade_start_time = 1.2
var fade_duration = 0.3

onready var GoalScrewDriver = $ScrewContainer/ScrewdriverContainer/GoalScrewdriver
onready var ScrewContainer = $ScrewContainer
onready var ScrewdriverContainer = $ScrewContainer/ScrewdriverContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	GoalScrewDriver.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if animation_start:
		var insert_time = min(animation_timer, screwdriver_insert_time) / screwdriver_insert_time
		var screwdriver_disp = math.sine_easing(insert_time, 20, 0)
		math.sine_easing(0.5, 0, 1)
		GoalScrewDriver.position = Vector2(screwdriver_disp, -screwdriver_disp)
		var spin_percent = clamp((animation_timer)/total_spin_time, 0, 1)
		# sine curve that bounces back a little
		var spin_eased = 1.03/2 * cos(3.5*spin_percent - PI) + 1.03/2
		var spin = (1 - spin_eased) * -PI/8 + (spin_eased) * 2*PI
		if spin < 0:
			ScrewdriverContainer.rotation = spin
		else:
			ScrewContainer.rotation = spin
		self.modulate.a = 1 - clamp((animation_timer - fade_start_time)/fade_duration, 0, 1)
		animation_timer += delta


func _on_Goal_body_entered(body):
	if body is Scientist:
		$Timer.start()
		animation_start = true
		animation_timer = 0
		GoalScrewDriver.visible = true


func _on_Timer_timeout():
	GameEvents.emit_signal("level_end")
	queue_free()
