extends Area2D


@export var Speed = 50
@onready var animation = $AnimationPlayer
@onready var flip = $Sprite2D
var moving_state = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	moving_state=true
	if Input.is_action_pressed("ui_right"):
		Movement(Speed*delta,0)
		flip.flip_h = false
	if Input.is_action_pressed("ui_left"):
		Movement(-Speed*delta,0)
		flip.flip_h = true
	if Input.is_action_pressed("ui_up"):
		Movement(0,-Speed*delta)
	if Input.is_action_pressed("ui_down"):
		Movement(0,Speed*delta)
		
		
	if moving_state == true:
		animation.play("Animation")
	else:
		animation.play("Idle")
	pass
	
		
		



func Movement(xspeed,yspeed):
	position.x +=xspeed
	position.y +=yspeed


func _on_area_entered(area: Area2D) -> void:
	flip.scale *= 1.1
	area.queue_free()
	pass # Replace with function body.
