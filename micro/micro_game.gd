# The root of each microgame
# Used by microgame_container to get input and output on state of microgame
@abstract
class_name MicroGame
extends Node2D

# Signal must be emitted to continue at all.
# Is the result of a microgame always a boolean?
signal complete(success: bool)


# Called after _ready when the microgame starts, the timer starts counting down
@abstract func start() -> void ;


# Called when the timer runs out for this game, usually indicating they failed.
@abstract func timeout() -> void ;
