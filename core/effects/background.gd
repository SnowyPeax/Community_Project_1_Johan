extends ParallaxBackground

# Inputted texture dimensions should be able to cleanly divide 512
# 
@export var texture : Texture2D

func _ready():
	if texture != null:
		$ParallaxLayer/Sprite2D.texture = texture
