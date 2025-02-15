event_inherited();

if(active) {
	
	if(aggro) {
		
		if(!kb){
			var dt = delta_time/100000;
			if(instance_exists(gun)){
				if(gun.collisionline){

					mp_potential_step_object(objPlayer.x, objPlayer.y, dt*spd, objBulletProof1);
				} else {
					if(sprite_index==sprLancelotRun) sprite_index=sprLancelotIdle;
					mp_potential_step_object(objPlayer.x, objPlayer.y, dt*walkspd, objBulletProof1);
				}
				if(place_meeting(x,y,objPlayerHitbox) and !objPlayer.hit){
					objPlayer.takeHit();
					objPlayer.hp-=20;
					knockback(kblength,point_direction(objPlayerHitbox.x,objPlayerHitbox.y,x,y),kbspd);
				}
			}
			if(direction<90 or direction>270) image_xscale=1;
			else image_xscale=-1
		
		
		}
	}
}

