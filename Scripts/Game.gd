extends Node2D

var speed = 400
var clicou = false
var ponto = 0
var disposicao = 1

func _ready():
#	$Line.hide()
	$Spr_person.position = $Line.points[0]
	set_process(true)
	
func _process(delta):
	print("disposição: " + str(disposicao))
	if disposicao < 1:
		disposicao += 0.01
	if disposicao > 0.2:
		if $Btn_go.pressed == true and clicou == false:
			disposicao -= 0.1
			clicou = true
			var d: float = $Spr_person.position.distance_to($Line.points[ponto])
			if d > 10:
				$Spr_person.position = $Spr_person.position.linear_interpolate($Line.points[ponto], ((speed * delta)/d)*disposicao)
			else:
				if ponto < 23:
					ponto += 1
				else:
					print("chegou ao fim")
		elif $Btn_go.pressed == false:
			clicou = false
	else:
		print("seu personagem esta muito cansado! Espere ele descansar!")
