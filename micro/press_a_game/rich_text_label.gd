extends RichTextLabel


func _on_complete(success: bool) -> void:
	if success:
		self.text = "You Win"
	else:
		self.text = "You Lose"
