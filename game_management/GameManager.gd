extends Node

const galaxy_scene = preload("res://galaxy/Galaxy.tscn")
var current_galaxy: Node2D

func _ready():
	current_galaxy = galaxy_scene.instance()
	add_child(current_galaxy)
	current_galaxy.generate_galaxy()

func save():
	return current_galaxy.save()

func load_save(savedata):
	# delete current galaxy
	current_galaxy.queue_free()
	
	# load
	current_galaxy = galaxy_scene.instance()
	add_child(current_galaxy)
	current_galaxy.load_save(savedata)