if(encounter) {
	draw_sprite_ext(sprProgressBar1, 0, 928, 120, 8, 8, 0, c_white, 255);
	instance_activate_object(objBoss);
	draw_sprite_part_ext( sprProgressBarInterior1, 0, 0, 0, 122*objBoss.hp/objBoss.maxhp, 16, 952, 112, 8,8, 0x5459ca, 255);
	if(stage == 2 or stage == 4 or stage==6){
		draw_sprite_ext(sprProgressBar, 0, 928, 200, 8, 8, 0, c_white, 255);
		draw_sprite_part_ext( sprProgressBarInterior, 0, 0, 0, 122*progress/maxprogress, 16, 952, 192, 8,8, colors[color], 255);
	}
	
	if(stage == 2 or stage == 4 or stage == 6) {
		if(color == 1 or color  == 3 or color == 5) {
			
			draw_sprite_ext( sprEnemyCount1, 0, 1850, 120, 6, 6, 0, c_white, .7);
			draw_set_alpha(1);
			draw_set_color(c_white)
			draw_set_font(Font1);
			//gpu_set_texfilter(1)
			draw_text(2050, 140, ds_list_size(objEncounter41.enemies1) + ds_list_size(objEncounter41.tocreate1)+ ds_list_size(objEncounter42.enemies1) + ds_list_size(objEncounter42.tocreate1)+ ds_list_size(objEncounter43.enemies1) + ds_list_size(objEncounter43.tocreate1));
			//gpu_set_texfilter(0)

			draw_set_color(c_white);
		} else {
			draw_sprite_ext( sprEnemyCount2, 0, 2350, 120, 6, 6, 0, c_white, .7);
			draw_set_alpha(1);
			draw_set_color(c_white)
			draw_set_font(Font1);
			//gpu_set_texfilter(1)
			draw_text(2550, 140, ds_list_size(objEncounter41.enemies2) + ds_list_size(objEncounter41.tocreate2)  +ds_list_size(objEncounter42.enemies2) + ds_list_size(objEncounter42.tocreate2) +  ds_list_size(objEncounter43.enemies2) + ds_list_size(objEncounter43.tocreate2));
			//gpu_set_texfilter(0)
			draw_set_color(c_white);
		}
	}
}