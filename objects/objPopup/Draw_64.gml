if(popup!=0) {
	draw_sprite_ext(sprPopup, 0, 100, 500, 4, 4, 0, c_white, 1);
	
	
	var gui_x = device_mouse_x_to_gui(0)
	var gui_y = device_mouse_y_to_gui(0)
	if point_in_rectangle(gui_x, gui_y, 100 + 24*4, 500 + 23*4, 100 + 39*4, 500 + 41*4){
		draw_sprite_ext(sprPopupButton, 1, 100, 500, 4, 4, 0, c_white, 1);
		
	
		
		if(mouse_check_button_pressed((mb_left))) popup=0;
		//show_debug_message(1);
	} else {
		draw_sprite_ext(sprPopupButton, 0, 100, 500, 4, 4, 0, c_white, 1)
	}
} else {
	objDrawable.sprite_index=sprSolid3;
	objDrawable2.sprite_index=sprSolid3;
	objDrawable.image_speed=1;
	objDrawable2.image_speed=1;
}
if(popup ==1){
	objDrawable.image_xscale = 8;
	objDrawable.image_yscale = 8;
	objDrawable.x = 280;
	objDrawable.y = 620;
	objDrawable.sprite_index=sprWASD;
	
	//draw_sprite_ext(sprWASD, 1, 280, 620, 8, 8, 0, c_white, 1);
} else if(popup ==2){
	objDrawable.image_xscale = 10;
	objDrawable.image_yscale = 10;
	objDrawable.x = 380;
	objDrawable.y = 640;
	objDrawable.sprite_index=sprMouseTutorial;
	
	//draw_sprite_ext(sprWASD, 1, 280, 620, 8, 8, 0, c_white, 1);
} else if(popup ==3){
	objDrawable.image_xscale = 3.5;
	objDrawable.image_yscale = 3.5;
	objDrawable.x = 200;
	objDrawable.y = 640;
	objDrawable.sprite_index=sprHealthMeter1;
	
	//draw_sprite_ext(sprWASD, 1, 280, 620, 8, 8, 0, c_white, 1);
} else if(popup ==4){
	objDrawable.image_xscale = 3.5;
	objDrawable.image_yscale = 3.5;
	objDrawable.x = 200;
	objDrawable.y = 640;
	objDrawable.sprite_index=sprHealthMeter2;
	
	//draw_sprite_ext(sprWASD, 1, 280, 620, 8, 8, 0, c_white, 1);
} else if(popup ==5){
	objDrawable.image_xscale = 8;
	objDrawable.image_yscale = 8;
	objDrawable.x = 220;
	objDrawable.y = 640;
	objDrawable.sprite_index=sprSpacePopup;
	
	//draw_sprite_ext(sprWASD, 1, 280, 620, 8, 8, 0, c_white, 1);
} else if(popup ==6){
	objDrawable.image_xscale = 8;
	objDrawable.image_yscale = 8;
	objDrawable.x = 280;
	objDrawable.y =700;
	objDrawable.sprite_index=sprButtonPopup;
	objDrawable2.image_xscale = 8;
	objDrawable2.image_yscale = 8;
	objDrawable2.x = 520;
	objDrawable2.y = 700;
	objDrawable2.sprite_index=sprButton;
	if(ds_list_size(objEncounter3.colorlist) <= 0 ){
		popup=0;
	} else if(instance_exists(objEncounter3.buttons[objEncounter3.colorlist[| 0]])) objDrawable2.image_index=objEncounter3.buttons[objEncounter3.colorlist[| 0]].image_index;
	
	
	//draw_sprite_ext(sprWASD, 1, 280, 620, 8, 8, 0, c_white, 1);
} if (popup=7) {
	objDrawable.image_xscale = 8;
	objDrawable.image_yscale = 8;
	objDrawable.x = 280;
	objDrawable.y =700;
	objDrawable.sprite_index=sprButtonPopup;
	objDrawable2.image_xscale = 8;
	objDrawable2.image_yscale = 8;
	objDrawable2.x = 520;
	objDrawable2.y = 700;
	objDrawable2.sprite_index=sprButton;
	if(instance_exists(objEncounter4)) objDrawable2.image_index=objEncounter4.buttons[objEncounter4.color].image_index;
}

