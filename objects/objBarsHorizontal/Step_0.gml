event_inherited()
if(instance_exists(objEncounter4)) {
	if(objEncounter4.open and sprite_index == sprBarsHorizontal){
		if(image_index != 10){
			image_speed= 1;

		} else {
			sprite_index = sprBarsHorizontalOpen;
			hitbox.sprite_index=sprBarsHorizontalOpen;
		}
	} else if (!objEncounter4.open and sprite_index != sprBarsHorizontal) {
		sprite_index=sprBarsHorizontal;
		hitbox.sprite_index = sprBarsHorizontalHitbox
		image_speed=0;
		image_index=0;

	} else {
		image_speed = 0;
		//show_debug_message(string(image_speed) + ";" + string(floor(image_index)))
	}

	//if(!objEncounter4.open and sprite_index == sprBars and floor(image_index) == 1) image_speed= 0;
} 
