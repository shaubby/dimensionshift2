var dt = delta_time/100000;
if (flashAlpha>0){
	draw_sprite_stretched_ext(sprBackground,0,0,0,display_get_gui_width(),display_get_gui_height(),c_white,flashAlpha);
}


if(redFlash<0){
	draw_sprite_ext( sprDimensionShift, 0, 2400, 1400, 1, 1, 0, c_white, 255);
	draw_sprite_part_ext(sprDimensionShiftInterior, 0, 0, 128-((15-cd)/15)*128, 128, ((15-cd)/15)*128, 2400, 1528-((15-cd)/15)*128, 1, 1, c_white, 1);
} else {
	draw_sprite_ext( sprDimensionShift, 0, 2400, 1400, 1, 1, 0, c_red, 255);
	draw_sprite_part_ext(sprDimensionShiftInterior, 0, 0, 128-((15-cd)/15)*128, 128, ((15-cd)/15)*128, 2400, 1528-((15-cd)/15)*128, 1, 1, c_red, 1);
}

if(flashAlpha>=0){flashAlpha-=.1*dt;}
if(redFlash>=0){redFlash-=1*dt;}
