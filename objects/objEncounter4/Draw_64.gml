if(encounter) {
	draw_sprite_ext(sprProgressBar1, 0, 928, 120, 8, 8, 0, c_white, 255);
	draw_sprite_part_ext( sprProgressBarInterior1, 0, 0, 0, 122*objBoss.hp/objBoss.maxhp, 16, 952, 112, 8,8, 0x5459ca, 255);
	if(stage == 2 or stage == 4 or stage==6){
		draw_sprite_ext(sprProgressBar, 0, 928, 200, 8, 8, 0, c_white, 255);
		draw_sprite_part_ext( sprProgressBarInterior, 0, 0, 0, 122*progress/maxprogress, 16, 952, 192, 8,8, colors[color], 255);
	}
}