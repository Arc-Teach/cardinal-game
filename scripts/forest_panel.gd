extends Sprite2D
class_name forest_background

@export var SPEED = 200
@export var sequence = 0
var xwidth
func _ready() -> void:
	xwidth = get_viewport_rect().size.x/2
	position.x = -xwidth + texture.get_width()*scale.x * sequence -1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	position.x -= SPEED
	if position.x + 0.5*texture.get_width()*scale.x < -xwidth:
		position.x = 2.5*texture.get_width()*scale.x - xwidth -1
	
