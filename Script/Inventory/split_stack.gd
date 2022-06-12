class_name Split_Stack extends ColorRect

signal stack_splitted

export ( NodePath ) onready var qty_slider = get_node( qty_slider ) as HSlider
export ( NodePath ) onready var lbl_original = get_node( lbl_original ) as Label
export ( NodePath ) onready var lbl_new = get_node( lbl_new ) as Label
export ( NodePath ) onready var popup = get_node( popup ) as Popup

var quantity
var new_quantity
var inventory_slot

func display( slot ):
	quantity = slot.item.quantity
	inventory_slot = slot
	qty_slider.max_value = quantity - 1
	qty_slider.min_value = 1
	qty_slider.step = 1
	qty_slider.value = int( round( quantity / 2 ) )
	set_labels()
	show()
	popup.popup()

func set_labels():
	lbl_original.text = str( qty_slider.value )
	new_quantity = quantity - qty_slider.value
	lbl_new.text = str( new_quantity )

func _on_X_Button_pressed():
	hide()

# warning-ignore:unused_argument
func _on_quantity_slider_value_changed(value):
	set_labels()

func _on_btn_split_pressed():
	emit_signal( "stack_splitted", inventory_slot, new_quantity )
	hide()

func _on_split_stack_hide():
	popup.hide()
