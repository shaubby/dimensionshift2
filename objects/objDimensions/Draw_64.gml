if( instance_exists(objPlayer)) {
	var dt = delta_time/100000;
	if (flashAlpha>0){
		draw_sprite_stretched_ext(sprBackground,0,0,0,display_get_gui_width(),display_get_gui_height(),c_white,flashAlpha);
	}


	if(!redFlash){
		draw_sprite_ext( sprDimensionShift, 0, 2300, 1300, 1.5, 1.5, 0, c_white, 255);
		draw_sprite_part_ext(sprDimensionShiftInterior, 0, 0, 128-((maxcd-cd)/maxcd)*128, 128, ((maxcd-cd)/maxcd)*128, 2300, 1492-((maxcd-cd)/maxcd)*128*1.5, 1.5, 1.5, c_white, 1);
	} else {
		draw_sprite_ext( sprDimensionShift, 0, 2300, 1300, 1.5, 1.5, 0, c_red, 255);
		draw_sprite_part_ext(sprDimensionShiftInterior, 0, 0, 128-((maxcd-cd)/maxcd)*128, 128, ((maxcd-cd)/maxcd)*128, 2300, 1492-((maxcd-cd)/maxcd)*128*1.5, 1.5, 1.5, c_red, 1);
	}

	if(flashAlpha>=0){flashAlpha-=.1*dt;}

}
