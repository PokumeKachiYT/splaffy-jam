extends MeshInstance3D

@export var color: Color = Color(0.0,0.0,0.0)

func _ready():
	mesh.material = mesh.material.duplicate()
	mesh.material.albedo_color = color
