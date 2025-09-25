extends Area2D

signal hoop_event(score:bool)

var max_speed = -10.0
var min_speed = -5.0
var velocity:Vector2
var min_x:int
var min_y:int
var max_y:int
var has_scored = false

func _ready() -> void:
	velocity.y = 0
	var rect = get_viewport_rect()
	min_x = -rect.size.x/2
	max_y = rect.size.y/2 - 200
	min_y = -max_y
	velocity.x = randi_range(-10,max_speed)
	

func _process(_delta: float) -> void:
	
	if position.x <= min_x:
		position.x = -min_x+50
		velocity.x = randf_range(min_speed,max_speed)
		position.y = randi_range(min_y,max_y)
		if !has_scored:
			hoop_event.emit(false)
		has_scored = false
		
	if has_overlapping_bodies():
		for body in get_overlapping_bodies():
			if body is player and !has_scored:
				has_scored = true
				hoop_event.emit(true)
				min_speed += min_speed * 0.05
				max_speed += max_speed * 0.07
	
	position.x += velocity.x
