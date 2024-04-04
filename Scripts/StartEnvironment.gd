extends WorldEnvironment

func _ready():
	environment.adjustment_brightness = 0
	
	await get_tree().create_timer(2.0).timeout
	create_tween().tween_property(environment,'adjustment_brightness',1,2)
