if(instance_exists(owner)){
	if(owner.active){
	if(image_index==7 and place_meeting(x,y,objPlayerHitbox)){
		if(!objPlayer.hit) {
			objPlayer.hp-=10;
			objPlayer.takeHit();
		}
	}
	}
	x=owner.x+lengthdir_x(10,image_angle)
	y=owner.y+lengthdir_y(10,image_angle)-9
}