extends BaseScreen


func _ready():
	update_buttons_with_levels()
	update_buttons_with_level_paths()


func update_buttons_with_levels():
	get_node("TabContainer/Tab1/GridContainer/LevelSelectionButton1").set_level_number(1)
	get_node("TabContainer/Tab1/GridContainer/LevelSelectionButton2").set_level_number(2)
	get_node("TabContainer/Tab1/GridContainer/LevelSelectionButton3").set_level_number(3)
	get_node("TabContainer/Tab1/GridContainer/LevelSelectionButton4").set_level_number(4)
	get_node("TabContainer/Tab1/GridContainer/LevelSelectionButton5").set_level_number(5)
	get_node("TabContainer/Tab1/GridContainer/LevelSelectionButton6").set_level_number(6)
	get_node("TabContainer/Tab1/GridContainer/LevelSelectionButton7").set_level_number(7)
	get_node("TabContainer/Tab1/GridContainer/LevelSelectionButton8").set_level_number(8)
	get_node("TabContainer/Tab1/GridContainer/LevelSelectionButton9").set_level_number(9)
	get_node("TabContainer/Tab1/GridContainer/LevelSelectionButton10").set_level_number(10)
	get_node("TabContainer/Tab2/GridContainer2/LevelSelectionButton11").set_level_number(11)
	get_node("TabContainer/Tab2/GridContainer2/LevelSelectionButton12").set_level_number(12)
	get_node("TabContainer/Tab2/GridContainer2/LevelSelectionButton13").set_level_number(13)
	get_node("TabContainer/Tab2/GridContainer2/LevelSelectionButton14").set_level_number(14)
	get_node("TabContainer/Tab2/GridContainer2/LevelSelectionButton15").set_level_number(15)
	get_node("TabContainer/Tab2/GridContainer2/LevelSelectionButton16").set_level_number(16)
	get_node("TabContainer/Tab2/GridContainer2/LevelSelectionButton17").set_level_number(17)
	get_node("TabContainer/Tab2/GridContainer2/LevelSelectionButton18").set_level_number(18)
	get_node("TabContainer/Tab2/GridContainer2/LevelSelectionButton19").set_level_number(19)
	get_node("TabContainer/Tab2/GridContainer2/LevelSelectionButton20").set_level_number(20)


func update_buttons_with_amount_of_deaths():
	get_node("TabContainer/Tab1/GridContainer/LevelSelectionButton1").set_amount_of_deaths()
	get_node("TabContainer/Tab1/GridContainer/LevelSelectionButton2").set_amount_of_deaths()
	get_node("TabContainer/Tab1/GridContainer/LevelSelectionButton3").set_amount_of_deaths()
	get_node("TabContainer/Tab1/GridContainer/LevelSelectionButton4").set_amount_of_deaths()
	get_node("TabContainer/Tab1/GridContainer/LevelSelectionButton5").set_amount_of_deaths()
	get_node("TabContainer/Tab1/GridContainer/LevelSelectionButton6").set_amount_of_deaths()
	get_node("TabContainer/Tab1/GridContainer/LevelSelectionButton7").set_amount_of_deaths()
	get_node("TabContainer/Tab1/GridContainer/LevelSelectionButton8").set_amount_of_deaths()
	get_node("TabContainer/Tab1/GridContainer/LevelSelectionButton9").set_amount_of_deaths()
	get_node("TabContainer/Tab1/GridContainer/LevelSelectionButton10").set_amount_of_deaths()
	get_node("TabContainer/Tab2/GridContainer2/LevelSelectionButton11").set_amount_of_deaths()
	get_node("TabContainer/Tab2/GridContainer2/LevelSelectionButton12").set_amount_of_deaths()
	get_node("TabContainer/Tab2/GridContainer2/LevelSelectionButton13").set_amount_of_deaths()
	get_node("TabContainer/Tab2/GridContainer2/LevelSelectionButton14").set_amount_of_deaths()
	get_node("TabContainer/Tab2/GridContainer2/LevelSelectionButton15").set_amount_of_deaths()
	get_node("TabContainer/Tab2/GridContainer2/LevelSelectionButton16").set_amount_of_deaths()
	get_node("TabContainer/Tab2/GridContainer2/LevelSelectionButton17").set_amount_of_deaths()
	get_node("TabContainer/Tab2/GridContainer2/LevelSelectionButton18").set_amount_of_deaths()
	get_node("TabContainer/Tab2/GridContainer2/LevelSelectionButton19").set_amount_of_deaths()
	get_node("TabContainer/Tab2/GridContainer2/LevelSelectionButton20").set_amount_of_deaths()


func update_buttons_with_level_paths():
	get_node("TabContainer/Tab1/GridContainer/LevelSelectionButton1").set_level_path("res://src/scenes/levels/prototypes/kf/kf_lvl_01.tscn")
	get_node("TabContainer/Tab1/GridContainer/LevelSelectionButton2").set_level_path("res://src/scenes/levels/prototypes/gsr/gsr_PhobosTutorialLevel.tscn")
	get_node("TabContainer/Tab1/GridContainer/LevelSelectionButton3").set_level_path("res://src/scenes/levels/prototypes/yummy/yjb_lvl_io_Tutorial.tscn")
	get_node("TabContainer/Tab1/GridContainer/LevelSelectionButton4").set_level_path("res://src/scenes/levels/prototypes/yummy/yjb_lvl_titan_Tutorial.tscn")
	get_node("TabContainer/Tab1/GridContainer/LevelSelectionButton5").set_level_path("res://src/scenes/levels/prototypes/kf/kf_lvl_02_PuckDash.tscn")
	get_node("TabContainer/Tab1/GridContainer/LevelSelectionButton6").set_level_path("res://src/scenes/levels/prototypes/yummy/yjb_lvl_05_random_button.tscn")
	get_node("TabContainer/Tab1/GridContainer/LevelSelectionButton7").set_level_path("res://src/scenes/levels/prototypes/gsr/gsr_BridgeFunLevel.tscn")
	get_node("TabContainer/Tab1/GridContainer/LevelSelectionButton8").set_level_path("res://src/scenes/levels/prototypes/gsr/gsr_SpinnySpin.tscn")
	get_node("TabContainer/Tab1/GridContainer/LevelSelectionButton9").set_level_path("res://src/scenes/levels/prototypes/yummy/yjb_lvl_04_backtrack.tscn")
	get_node("TabContainer/Tab1/GridContainer/LevelSelectionButton10").set_level_path("res://src/scenes/levels/prototypes/gsr/gsr_Timer.tscn")
	get_node("TabContainer/Tab1/GridContainer/LevelSelectionButton11").set_level_path("res://src/scenes/levels/prototypes/gsr/gsr_Puzzle.tscn")
	get_node("TabContainer/Tab2/GridContainer2/LevelSelectionButton12").set_level_path("res://src/scenes/levels/prototypes/kf/kf_lvl_ThePit.tscn")
	get_node("TabContainer/Tab2/GridContainer2/LevelSelectionButton13").set_level_path("res://src/scenes/levels/prototypes/yummy/yjb_lvl_03_Falling_IO_focused.tscn")
	get_node("TabContainer/Tab2/GridContainer2/LevelSelectionButton14").set_level_path("res://src/scenes/levels/prototypes/kf/kf_lvl_03.tscn")
	get_node("TabContainer/Tab2/GridContainer2/LevelSelectionButton15").set_level_path("res://src/scenes/levels/prototypes/gsr/gsr_Confusing.tscn")
	get_node("TabContainer/Tab2/GridContainer2/LevelSelectionButton16").set_level_path("res://src/scenes/levels/prototypes/gsr/gsr_Crossroads.tscn")
	get_node("TabContainer/Tab2/GridContainer2/LevelSelectionButton17").set_level_path("res://src/scenes/levels/prototypes/yummy/yjb_lvl_01_IO_Focused.tscn")
	get_node("TabContainer/Tab2/GridContainer2/LevelSelectionButton18").set_level_path("res://src/scenes/levels/prototypes/gsr/gsr_ExpertMode.tscn")
	get_node("TabContainer/Tab2/GridContainer2/LevelSelectionButton19").set_level_path("res://src/scenes/levels/prototypes/yummy/yjb_lvl_02_Titan_Focused.tscn")
	get_node("TabContainer/Tab2/GridContainer2/LevelSelectionButton20").set_level_path("res://src/scenes/levels/prototypes/gsr/gsr_EasyDeadLevel.tscn")


func get_amount_of_deaths_from_save():
	pass


func update_button_availability(highest_level: int):
	for button_a in get_node("TabContainer/Tab1/GridContainer").get_children():
		if button_a.get_level_number() >= highest_level:
			button_a.show()
		else: 
			button_a.hide()
			
	for button_b in get_node("TabContainer/Tab2/GridContainer2").get_children():
		if button_b.get_level_number() >= highest_level:
			button_b.show()
		else: 
			button_b.hide()
