var dt = delta_time/100000;
if(cd<=0){
	
	
	if(currentdimension==1){
		var collide = false
		with(objPlayer) collide=place_meeting(x,y, objParentSolid2);
		if(keyboard_check_pressed(vk_space)){
			if(!collide) {
				audio_play_sound(sndDimensionShift, 5, false)
				alarm_set(0, 1);
				alarm_set(2, 5/dt);
				flashAlpha=.75;
				cd=maxcd;
			}
		}
		if collide redFlash=true;
		else redFlash=false;
			
		
	} else if (currentdimension==2){
		var collide = false
		with(objPlayer) collide=place_meeting(x,y, objParentSolid1);
		if(keyboard_check_pressed(vk_space)){
			if(!collide) {
				audio_play_sound(sndDimensionShift, 5, false)
				alarm_set(1, 1);
				alarm_set(3, 5/dt);
				flashAlpha=.75;
				cd=maxcd;
			}
		}
		if collide redFlash=true;
		else redFlash=false;
	
	}
}
if cd>0 cd-=dt;