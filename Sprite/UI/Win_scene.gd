extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$VFlowContainer/Label.text = TheWinnerIs.the_winner_is + " Win"
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_new_game_button_pressed():
	get_tree().change_scene_to_file("res://Root.tscn")


func _on_quit_button_pressed():
	get_tree().quit()
