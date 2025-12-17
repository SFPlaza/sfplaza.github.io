extends Sprite2D

var ID = 0
var Last = 0
@onready var MP = get_node("/root/MainProcessor")
@onready var SP = get_node("/root/MainProcessor/Stage")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	ID = MP.PixelCount
	MP.PixelCount += 1
	#print(MP.Gates.size(),ID)
	#if MP.PixelCount < MP.XPix * MP.YPix:
	#	var node = self.duplicate()
	#	SP.add_child.call_deferred(node)
	self.set_name("Stage Pixel " + str(ID))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.scale.x = 30.0/MP.XPix
	self.scale.y = 15.0/MP.YPix
	self.position.x = (ID%MP.XPix) * (20*self.scale.x)
	self.position.y = floor(ID/MP.XPix) * (20*self.scale.y)
	if (MP.PixelCount < MP.XPix * MP.YPix) and (ID == MP.PixelCount - 1):
		var node = self.duplicate()
		SP.add_child.call_deferred(node)
	if (MP.XPix * MP.YPix) <= ID:
		MP.PixelCount -= 1
		self.queue_free()
	if ((MP.XPix * MP.YPix) >= (ID+1)):
		if (MP.PixelData[ID] == Last):
			var colorimg = Image.create_empty(20,20,false,Image.FORMAT_RGBF)
			if (MP.PixelData.size() > 1):
				if MP.PixelData[ID] != null:
					var adjColor = MP.PixelData[ID]**0.333
					colorimg.fill(Color(0,adjColor,adjColor,1))
			self.texture = ImageTexture.create_from_image(colorimg)
		Last = MP.PixelData[ID]
