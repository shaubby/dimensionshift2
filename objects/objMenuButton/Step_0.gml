if point_in_rectangle(mouse_x,mouse_y,bbox_left,bbox_top,bbox_right,bbox_bottom) {
	image_index=1;
	if(mouse_check_button(mb_left)){
		image_index=2;
		audio_stop_all();
		room=Room3;
	}
} else image_index=0;