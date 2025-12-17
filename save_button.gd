extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.position.x = ((get_viewport_rect().size.x - 180) / 2) + 9
	self.position.y = (get_viewport_rect().size.y / 2) + 9 - 30 + 18 + min(1,(get_viewport_rect().size.y/1080))*72*2
	self.scale.x = 1#(get_viewport_rect().size.x) / 512
	self.scale.y = min(1,(get_viewport_rect().size.y/1080))#60


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.position.x = ((get_viewport_rect().size.x - 180) / 2) + 9
	self.position.y = (get_viewport_rect().size.y / 2) + 9 - 30 + 27 + min(1,(get_viewport_rect().size.y/1080))*72*3
	self.scale.x = 1#(get_viewport_rect().size.x) / 512
	self.scale.y = min(1,(get_viewport_rect().size.y/1080))#60

func _on_button_down() -> void:
	get_node("/root/MainProcessor/SaveDialog").show()
	await get_node("/root/MainProcessor/SaveDialog").file_selected
	var saveFile = FileAccess.open(get_node("/root/MainProcessor/SaveDialog").get_current_file(),FileAccess.WRITE)
	saveFile.store_var([get_node("/root/MainProcessor").RawProgram,get_node("/root/MainProcessor").VControlArray])
	saveFile.close()
	
	
