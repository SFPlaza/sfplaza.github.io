extends TextureButton

var ID = 0
@onready var MP = get_node("/root/MainProcessor")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ID = MP.VControlCount
	MP.VControlCount += 1
	MP.VControlArray.push_back(false)
	#print(MP.Gates.size(),ID)
	#if MP.VLineCount < 14:
	#	var node = self.duplicate()
	#	MP.add_child.call_deferred(node)
	self.set_name("Line " + str(ID) + " Control")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.position.x = 65 + MP.staffPan.x + 65*ID 
	self.position.y = 0 + MP.staffPan.y
	if (MP.VControlArray.size() > (ID+1)):
		self.button_pressed = MP.VControlArray[ID+1]
	var nextIsLoop = false
	var prevIsLoop = false
	if (MP.VControlArray.size() > (ID+2)):
		nextIsLoop = MP.VControlArray[ID+2]
	if (MP.VControlArray.size() > (ID)):
		prevIsLoop = MP.VControlArray[ID]
	if nextIsLoop and prevIsLoop:
		self.texture_pressed = ImageTexture.create_from_image(Image.load_from_file("LoopControl.png"))
		self.scale.x = 1
	elif nextIsLoop:
		self.texture_pressed = ImageTexture.create_from_image(Image.load_from_file("LoopBorder.png"))
		self.scale.x = 1
	elif prevIsLoop:
		self.texture_pressed = ImageTexture.create_from_image(Image.load_from_file("LoopBorder.png"))
		self.scale.x = -1
		self.position.x += 65
	else:
		self.texture_pressed = ImageTexture.create_from_image(Image.load_from_file("LoopSmall.png"))
		self.scale.x = 1
	if (MP.Program.size() - 1) <= ID:
		if ID != 0:
			MP.VControlCount -= 1
			MP.VControlArray.pop_back()
			self.queue_free()
	if (MP.Program.size() - 1) > MP.VControlCount:
		if ID == MP.VControlCount - 1:
			var node = self.duplicate()
			MP.add_child.call_deferred(node)



func _on_toggled(toggled_on: bool) -> void:
	if MP.VControlArray.count(true) > 0 and toggled_on:
		var dir = 0
		if (MP.VControlArray.find(true) - (ID+1)) > 0:
			dir = 1
		else:
			dir = -1
		var goToPos = MP.VControlArray.find(true)
		for idC in range(ID+1,goToPos,dir):
			MP.VControlArray[idC] = true
	MP.VControlArray[ID + 1] = toggled_on
	
