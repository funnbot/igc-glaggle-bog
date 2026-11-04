## The root of each microgame
## Used by microgame_container to get input and output on state of microgame
@abstract
class_name MicroGame
extends Node2D

enum Result {
	SUCCESS,
	FAILURE,
	TIMEOUT,
}

## Signal must be emitted to continue at all.
## TODO: Is the result of a microgame always a boolean?
@warning_ignore("unused_signal")
signal complete(result: Result)


## Called way after _ready when the microgame starts, the timer starts counting down
## the microgame has process mode disabled, until it is started.
@abstract func start() -> void
