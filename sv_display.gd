extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.position.x = 0
	self.position.y = (get_viewport_rect().size.y)
	self.scale.x = 1#(get_viewport_rect().size.x) / 512
	self.scale.y = 1#60


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.texture = get_node("../Compute/StateVector").texture
	self.position.x = 0
	self.position.y = (get_viewport_rect().size.y)
	self.scale.x = 60
	self.scale.y = (get_viewport_rect().size.x) / self.texture.get_height()
