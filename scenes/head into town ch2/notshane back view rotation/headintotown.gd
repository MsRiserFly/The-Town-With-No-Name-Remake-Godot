extends AnimatedCutsceneSprite2D_sprite_array

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	super()
	
func _on_sprite_array_finished():
	animation_player.play('fade to black amiga')
	await animation_player.animation_finished
	super()
