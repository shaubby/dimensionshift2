if(encounter){
	draw_sprite_ext( sprEnemyCount2, 0, 2350, 120, 6, 6, 0, c_white, .7);
	draw_set_alpha(255)
	draw_set_color(c_white)
	draw_set_font(Font1);
	//gpu_set_texfilter(1)
	draw_text(2550, 140, ds_list_size(enemies2) + ds_list_size(tocreate2));
	//gpu_set_texfilter(0)
	draw_sprite_ext( sprEnemyCount1, 0, 1850, 120, 6, 6, 0, c_white, .7);
	draw_set_alpha(255)
	draw_set_color(c_white)
	draw_set_font(Font1);
	//gpu_set_texfilter(1)
	draw_text(2050, 140, ds_list_size(enemies1) + ds_list_size(tocreate1));
	//gpu_set_texfilter(0)
}