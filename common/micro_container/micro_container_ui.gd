extends Control

@export var _overlay_intro: Control
@export var _overlay_call: Control
@export var _transition: Panel
@export var _overlay_success: Control
@export var _overlay_fail: Control
@export var _inner_panel: Control


func _ready() -> void:
	_overlay_intro.visible = true
	_overlay_call.visible = false
	_overlay_fail.visible = false
	_overlay_success.visible = false
	_transition.visible = false
	_inner_panel.visible = false


func _on_state_changed(state: MicroContainer.State) -> void:
	match state:
		MicroContainer.State.Load:
			_overlay_intro.visible = true
			_overlay_call.visible = false
			_overlay_fail.visible = false
			_overlay_success.visible = false
			_transition.visible = false
		MicroContainer.State.Call:
			_overlay_intro.visible = false
			_overlay_call.visible = true
		MicroContainer.State.Transition:
			_overlay_call.visible = false
			_transition.visible = true
			_inner_panel.visible = true
			_transition._on_transition_begin()
		MicroContainer.State.Start:
			_transition.visible = false
		MicroContainer.State.ResultSuccess:
			_overlay_success.visible = true
			_inner_panel.visible = false
		MicroContainer.State.ResultFail:
			_overlay_fail.visible = true
			_inner_panel.visible = false
