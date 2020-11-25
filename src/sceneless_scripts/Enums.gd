extends Node


class_name Enums


enum PLAYER_STATE{
	IDLE,		# Regular states
	RUNNING,
	JUMPING,
	FALLING,
	LANDING,
	DEAD,
	FLOATING,	#Power-up states
	DASHING,
	THROWING,
	PHASING,
	PUSHING,
	PULLING,
}


enum FIRING_DIRECTIONS{
	UP, 
	RIGHT, 
	DOWN, 
	LEFT,
}


enum SCREENS{
	MAIN_MENU,
	CREDITS,
	INTRO,
	TEMPLATE,
	END,
}
