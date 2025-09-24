extends AnimatedSprite2D
class_name leaf

@export var fall_speed = -14
var max_height
var frame_width

func _ready() -> void:
		max_height = get_viewport_rect().size.y/2 + 100
		frame_width = get_viewport_rect().size.x/2
	
func _process(_delta: float) -> void:
	position.y -= fall_speed
	play("default")
	if position.y > max_height:
		position.y = -max_height
		position.x = randi_range(-frame_width,frame_width)
	
