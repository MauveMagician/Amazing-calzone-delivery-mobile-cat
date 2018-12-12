extends Node
const TRANS = Tween.TRANS_SINE
const EASE = Tween.EASE_IN_OUT
var amplitude = 0
var priority = 0

onready var camera = get_parent()

func start(_duration = 0.3, _frequency = 90, _amplitude = 90, _priority=0):
	if _priority >= self.priority:
		self.priority = _priority
		self.amplitude = _amplitude
		$Duration.wait_time = _duration
		$Frequency.wait_time = 1/float(_frequency)
		$Duration.start()
		$Frequency.start()
		new_shake()

func new_shake():
	var rand = Vector2()
	rand.x = rand_range(-amplitude, amplitude)
	rand.y = rand_range(-amplitude, amplitude)
	$ShakeTween.interpolate_property(camera, "offset", camera.offset, rand, $Frequency.wait_time, TRANS, EASE)
	$ShakeTween.start()

func reset():
	$ShakeTween.interpolate_property(camera, "offset", camera.offset, Vector2(), $Frequency.wait_time, TRANS, EASE)
	$ShakeTween.start()
	priority = 0

func _on_Frequency_timeout():
	new_shake()
	

func _on_Duration_timeout():
	reset()
	$Frequency.stop()

func _on_Calzone_explodeSignal():
	start()

func _on_Calzone2_explodeSignal():
	start()

func _on_Calzone3_explodeSignal():
	start()

func _on_Calzone4_explodeSignal():
	start()

func _on_Calzone5_explodeSignal():
	start()