if(active){
	if(place_meeting(x,y,objPlayer)){
	if(traps[| 0].image_index!=4){
		for(var i = 0; i < ds_list_size(traps);i++){
			traps[| i].image_speed=1;
		}
	} else {
		for(var i = 0; i < ds_list_size(traps);i++){
			traps[| i].image_speed=0;
		}
		if(!objPlayer.hit){
			objPlayer.takeHit();
			objPlayer.hp-=10;
		}
	}
	} else {
		if(traps[| 0].image_index!=0){
			for(var i = 0; i < ds_list_size(traps);i++){
				traps[| i].image_speed=0;
				traps[| i].image_index=0;
			}
		}
	}
}
	