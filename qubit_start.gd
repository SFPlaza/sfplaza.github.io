extends TextureButton

var ID = 0
@onready var MP = get_node("/root/MainProcessor")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	ID = MP.QubitCount
	MP.QubitCount += 1
	#print(MP.Gates.size(),ID)
	if MP.QubitCount < 13:
		var node = self.duplicate()
		MP.add_child.call_deferred(node)
	self.set_name("Qubit " + str(ID) + " Start")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.position.x = 0 + MP.staffPan.x
	self.position.y = 65 + 65*ID + MP.staffPan.y
