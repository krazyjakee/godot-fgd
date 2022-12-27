@tool

extends Node3D

@export var initial_scale = 5.0

@export var fgd_model = {
  "path": "entities/models/sphere.gltf",
  "scale": initial_scale
}

func _physics_process(_delta):
  scale = Vector3(initial_scale, initial_scale, initial_scale)
