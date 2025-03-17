if(instance_exists(owner)){
	if(owner.active){
		if(image_index==9 and place_meeting(x,y,objPlayerHitbox)){
			if(!objPlayer.hit) {
				objPlayer.hp-=10;
				objPlayer.takeHit();
			}
			image_alpha-=1
		}
	}
}