extends AnimatedCutsceneSprite2D_sprite_array
class_name AnimatedCutsceneSprite2D_censored

#@export var censored_sprite_
#Dictionary
#Dictionary[String,Array[SpriteFrames]]
@export var censored_no_gore_sprite : SpriteFrames
@export var censored_no_death_sprite : SpriteFrames

func _ready() -> void:
	super()
	#print("censord is ready")
	_change_censored_sprite()
	_configure_spriteframes()
	play()
	
func _change_censored_sprite():
	match SettingsAutoload.Censor_Type:
		0:
			pass
		1:
			sprite_frames = censored_no_gore_sprite
			print("no gore")
		2:
			sprite_frames = censored_no_death_sprite
			print("no death")
	#IDK WHAT TO WRITE HERE IDK HOW TO CONNECT IT TO PARENT I DIDN'T WANT TO COPY PASTE THE PARENT CODE
