extends Node2D

var red_stone_scene = preload("res://stone_red.tscn")
var blue_stone_scene = preload("res://blue_stone.tscn")

signal winner_found(stone)

var is_winner = false
var width = 10
var height = 10
var current_stone:Node2D 

var grid  = [0,0,0,0,0,0,0,0,0,
			0,0,0,0,0,0,0,0,0,
			0,0,0,0,0,0,0,0,0,
			0,0,0,0,0,0,0,0,0,
			0,0,0,0,0,0,0,0,0,
			0,0,0,0,0,0,0,0,0,
			0,0,0,0,0,0,0,0,0,
			0,0,0,0,0,0,0,0,0,
			0,0,0,0,0,0,0,0,0,]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_cursor_place_at(area):
	var area_name:String = ""
	if current_stone == null:
		current_stone = red_stone_scene.instantiate()
	if area.get_child_count() == 1 && is_winner == false:
		change_curent_stone()
		area_name = area.name
		var array_name = area_name.split();
		var tmp = area_name_to_grid_index(array_name[0], array_name[1]);
		if current_stone.name == "RedStone":
			edit_grid(tmp[1],tmp[0], 1)
		
		elif current_stone.name == "BlueStone":
			edit_grid(tmp[1],tmp[0], 2)
		
		area.add_child(current_stone)
		check_win_horizontal()
		check_win_vertical()
		check_win_diagonal_left()
		check_win_diagonal_right()
		


func change_curent_stone():
	if current_stone.name == "RedStone":
		current_stone = blue_stone_scene.instantiate()
		
	elif current_stone.name == "BlueStone":
		current_stone = red_stone_scene.instantiate()

func area_name_to_grid_index(row:String, col:String):
	var rows:int
	var coloum:int
	match col:
		"A":
			coloum = 0
		"B":
			coloum = 1
		"C":
			coloum = 2
		"D":
			coloum = 3
		"E":
			coloum = 4
		"F":
			coloum = 5
		"G":
			coloum = 6
		"H":
			coloum = 7
		"I":
			coloum = 8

	match row:
		"1":
			rows = 0
		"2":
			rows = 1
		"3":
			rows = 2
		"4":
			rows = 3
		"5":
			rows = 4
		"6":
			rows = 5
		"7":
			rows = 6
		"8":
			rows = 7
		"9":
			rows = 8
	return [rows,coloum]

func edit_grid(row:int , col:int, data:int):
	grid[9 * row + col] = data

func get_grid_data(row:int , col:int):
	grid[9 * row + col]
	

func check_win_horizontal():
	for j in range(0, 9):
		for i in range(0,6):
			if grid[9*j +i] == 2 && grid[9*j +i +1] == 2&& grid[9*j +i+2] == 2 && grid[9*j +i+3] == 2:
				is_winner = true
				winner_found.emit("Blue")
			if grid[9*j +i] == 1 && grid[9*j +i +1] == 1 && grid[9*j +i+2] == 1 && grid[9*j +i+3] == 1:
				is_winner = true
				winner_found.emit("Red")

func check_win_vertical():
	for j in range(0, 9):
		for i in range(0,6):
			if grid[9*i +j] == 2 && grid[9*(i + 1) + j] == 2&& grid[9*(i + 2) + j] == 2 && grid[9*(i + 3) + j] == 2:
				is_winner = true
				winner_found.emit("Blue")
			if grid[9*i +j] == 1 && grid[9*(i + 1) + j] == 1 && grid[9*(i + 2) + j] == 1 && grid[9*(i + 3) + j] == 1:
				is_winner = true
				winner_found.emit("Red")

func check_win_diagonal_left():
	for j in range(0,6):
		for i in range(0,6):
			if grid[9*i +j] == 2 && grid[9*(i + 1) + (j+ 1)] == 2&& grid[9*(i + 2) + (j+ 2)] == 2 && grid[9*(i + 3) + (j+ 3)] == 2:
				is_winner = true
				winner_found.emit("Blue")
			if grid[9*i +j] == 1 && grid[9*(i + 1) + (j+ 1)] == 1 && grid[9*(i + 2) + (j+ 2)] == 1 && grid[9*(i + 3) + (j+ 3)] == 1:
				is_winner = true
				winner_found.emit("Red")

func check_win_diagonal_right():
	for j in range(0,6):
		for i in range(3,9):
			if grid[9*j + i] == 2 && grid[9*(j + 1) + (i - 1)] == 2&& grid[9*(j + 2) + (i - 2)] == 2 && grid[9*(j + 3) + (i - 3)] == 2:
				is_winner = true
				winner_found.emit("Blue")
			if grid[9*j + i] == 1 && grid[9*(j + 1) + (i - 1)] == 1 && grid[9*(j + 2) + (i - 2)] == 1 && grid[9*(j + 3) + (i - 3)] == 1:
				is_winner = true
				winner_found.emit("Red")
