extends Line2D

var ID = 0
@onready var MP = get_node("/root/MainProcessor")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ID = MP.LineCount
	MP.LineCount += 1
	#print(MP.Gates.size(),ID)
	if MP.LineCount < 13:
		var node = self.duplicate()
		MP.add_child.call_deferred(node)
	self.set_name("Gates " + str(ID) + " Line")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.points = PackedVector2Array([Vector2(60,97.5+65*ID)+MP.staffPan,Vector2(get_viewport_rect().size.x-MP.staffPan.x,97.5+65*ID)+MP.staffPan])
	
