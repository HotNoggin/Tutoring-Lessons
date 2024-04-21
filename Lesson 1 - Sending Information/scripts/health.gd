class_name HealthComponent
extends Node

# You can make your own signals
signal drained
signal changed(value: int)


# Exporting a value lets you set it in the inspector
# Each instance of HealthComponent will have its own starting value
@export var value: int = 100:
	# Using "set(new_value)" lets you run code when this variable is set
	# "new_value" is what it will be set to
	set(new_value):
		# You still have to set it manually in the setter!
		value = new_value
		# In this example we're using this to emit signals when health is changed or drained
		changed.emit(new_value)
		if value <= 0:
			drained.emit()
