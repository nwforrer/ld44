extends Control

signal retrieve_bodies

func _on_RetrieveBodiesButton_pressed():
	emit_signal("retrieve_bodies")
