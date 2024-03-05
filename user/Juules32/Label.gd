extends Label

@export var count = 0
@export var number_of_bananas = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.text = "Bananas: " + str(count) + "/" + str(number_of_bananas)
	if count >= number_of_bananas:
		count = 0
		Levelmanager.stop_time()
		Levelmanager.display_default_end_screen()
		
