extends Node2D



var area_count = [];

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_area_2d_area_entered(area):
	area_count.append(area)

func _on_area_2d_area_exited(area):
	area_count.erase(area)
