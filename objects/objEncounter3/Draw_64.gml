if(encounter and ds_list_size(colorlist) > 0) {
	draw_sprite_ext(sprProgressBar, 0, 928, 120, 8, 8, 0, c_white, 255);
	draw_sprite_part_ext( sprProgressBarInterior, 0, 0, 0, 122*progress/maxprogress, 16, 952, 112, 8,8, colors[colorlist[| 0]], 255);
}
if(encounter) draw_sprite_ext(sprMap, 0,50, 50, 10, 10, 0, c_white, 255); 
if(encounter){
	draw_sprite_ext( sprEnemyCount2, 0, 2350, 120, 6, 6, 0, c_white, .7);
	draw_set_alpha(1)
	draw_set_color(c_white)
	draw_set_font(Font1);
	//gpu_set_texfilter(1)
	draw_text(2550, 140, ds_list_size(enemies2) + ds_list_size(tocreate2));
	//gpu_set_texfilter(0)
	draw_sprite_ext( sprEnemyCount1, 0, 1850, 120, 6, 6, 0, c_white, .7);
	draw_set_alpha(1)
	draw_set_color(c_white)
	draw_set_font(Font1);
	//gpu_set_texfilter(1)
	draw_text(2050, 140, ds_list_size(enemies1) + ds_list_size(tocreate1));
	//gpu_set_texfilter(0)
}
draw_set_color(c_white);