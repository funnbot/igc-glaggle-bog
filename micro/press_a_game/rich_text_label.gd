extends RichTextLabel


func _on_complete(result: MicroGame.Result) -> void:
	match result:
		MicroGame.Result.SUCCESS:
			self.text = "You Win"
		MicroGame.Result.FAILURE:
			self.text = "You Lose"
