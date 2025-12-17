extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.position.x = get_viewport_rect().size.x / 2
	self.position.y = (get_viewport_rect().size.y - 60)/2
	self.scale.x = (get_viewport_rect().size.x / 2) / 600
	self.scale.y = ((get_viewport_rect().size.y - 60) / 2) / 300


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.position.x = get_viewport_rect().size.x / 2
	self.position.y = (get_viewport_rect().size.y - 60)/2
	self.scale.x = (get_viewport_rect().size.x / 2) / 600
	self.scale.y = ((get_viewport_rect().size.y - 60) / 2) / 300
