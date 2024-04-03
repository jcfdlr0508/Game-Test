extends Node

@onready var points_label = %PointsLabel


var points = 0

func add_point():
	points+=100
	print(points)
	points_label.text = "Points:" + str(points)
