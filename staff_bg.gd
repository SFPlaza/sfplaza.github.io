extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.position.x = 0
	self.position.y = 0
	self.scale.x = (get_viewport_rect().size.x) / 512
	self.scale.y = ((get_viewport_rect().size.y - 60) / 2) / 512


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.position.x = 0
	self.position.y = 0
	self.scale.x = (get_viewport_rect().size.x) / 512
	self.scale.y = ((get_viewport_rect().size.y - 60) / 2) / 512
