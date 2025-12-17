extends Sprite2D

@onready var MP = get_node("/root/MainProcessor")

func _process(delta: float) -> void:
	self.position.x = 65 + MP.staffPan.x + 65*MP.VControlCount
	self.position.y = 0 + MP.staffPan.y
