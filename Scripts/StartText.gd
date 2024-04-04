extends Label

signal lmb

@onready var sub_viewport: SubViewport = get_parent()
@onready var sprite: Sprite3D = sub_viewport.get_parent()

@onready var left_click = $LeftClick

const letter_delay = 0.05
const sentence_delay = 1.0

const Messages = [
	'Hey there random guy!',
	"Don't worry, it's me, Larry, the one who built, and now owns this building.",
	"Anyways, since you're reading this, it's very likely that the battery lights have run out...",
	"... which means that now you'll have to replace the battery.",
	"All by yourself.",
	"This message has been left on this computer as an instruction for fixing the lights...",
	"... which I'd say is a pretty easy job.",
	"You see, every worker here is equipped with a flashlight that runs on AA batteries, which one you can toggle by left clicking.",
	"And our power just so happens to run on AA batteries too!",
	"So now, all you've got to do is make your way to the electrical box...",
	"... and replace the battery in the box with the ones in your flashlight!",
	"Simple, right?",
	"You may use the flashlight on your way there, but remember to...",
	"... reserve at least ONE battery for the power box, as that the minimum amount of power required to run the lights.",
	"Good luck, and see ya! This computer's UPS is probably going to run out soon, so you'd better get going!",
	''
]

func _ready() -> void:
	await get_tree().create_timer(5.0).timeout
	
	var index = 0
	
	for Message in Messages:
		text = ''
		
		for Char in Message:
			if Input.is_action_pressed('rmb'):
				text = Message
				break
			
			text += Char
			await get_tree().create_timer(letter_delay).timeout
		
		if index == 7:
			Global.ToggleUI.emit()
		
		left_click.show()
		
		await lmb
		
		left_click.hide()
		
		index += 1
	
	#sprite.visible = false
	Global.StartGame.emit()

func _physics_process(delta) -> void:
	if Input.is_action_just_pressed('lmb'):
		lmb.emit()
