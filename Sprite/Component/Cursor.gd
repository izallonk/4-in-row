extends Node2D

signal Place_at (area)

var area_list = []

var stone:Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	position  = get_global_mouse_position()

func _input(event):
	if event.is_action_pressed("click"):
		if area_list.size() == 0:
			pass
		else:
			Place_at.emit(area_list[0])
		


func _on_area_2d_area_entered(area):
	area_list.append(area)
	


func _on_area_2d_area_exited(area):
	area_list.erase(area)
