if(encounter and ds_list_size(colorlist) > 0) {
	draw_sprite_ext(sprProgressBar, 0, 928, 120, 8, 8, 0, c_white, 255);
	draw_sprite_part_ext( sprProgressBarInterior, 0, 0, 0, 122*progress/maxprogress, 16, 952, 112, 8,8, colors[colorlist[| 0]], 255);
}
if(encounter) draw_sprite_ext(sprMap, 0,50, 50, 10, 10, 0, c_white, 255); 