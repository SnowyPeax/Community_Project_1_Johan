extends Label

@export var count = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.text = "Collectibles: " + str(count)
