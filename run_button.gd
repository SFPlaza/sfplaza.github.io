extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.position.x = ((get_viewport_rect().size.x - 180) / 2) + 9
	self.position.y = (get_viewport_rect().size.y / 2) + 9 - 30
	self.scale.x = 1#(get_viewport_rect().size.x) / 512
	self.scale.y = min(1,(get_viewport_rect().size.y/1080))#60


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.position.x = ((get_viewport_rect().size.x - 180) / 2) + 9
	self.position.y = (get_viewport_rect().size.y / 2) + 9 - 30
	self.scale.x = 1#(get_viewport_rect().size.x) / 512
	self.scale.y = min(1,(get_viewport_rect().size.y/1080))#60


func _on_button_down() -> void:
	get_parent().StepChange = 9999
