extends TextureButton

var ID = 0
@onready var MP = get_node("/root/MainProcessor")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.position.x = 0 + MP.staffPan.x
	self.position.y = 0 +  MP.staffPan.y



func _on_pressed() -> void:
	MP.VControlArray.fill(false);
