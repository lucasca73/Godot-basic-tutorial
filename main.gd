extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var miss = false

func begin():
	$Disk.dead = false
	$Disk.hit = false
	$Disk.clicks = 0
	$Disk.born()
	$LoseLabel.hide()
	$ClicksLabel.text = 'Clicks: ' + str($Disk.clicks)

# Called when the node enters the scene tree for the first time.
func _ready():
	begin()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Disk.hit == false and miss == true:
		$Disk.dead = true
		$LoseLabel.show()
		print('Death!')
		
	if $Disk.hit == true:
		$ClicksLabel.text = 'Clicks: ' + str($Disk.clicks)
	
	$Disk.hit = false
	miss = false
	


func _on_Area2D2_input_event(viewport, event, shape_idx):
	
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		if $Disk.dead:
			begin()
			return
		miss = true
		print('handle miss')
