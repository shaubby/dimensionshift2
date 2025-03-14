event_inherited();

if(active) {
	var dt =delta_time/100000
	if(aggro) {
		
		if(!kb){
			
			//if(instance_exists(gun)){
				//direction=point_direction(x,y,objPlayerHitbox.x,objPlayerHitbox.y)
				//speed=dt*spd
				mp_potential_step_object(objPlayerHitbox.x,objPlayerHitbox.y,spd*dt,objBulletProof1);
			//}
			if(direction<90 or direction>270) image_xscale=1;
			else image_xscale=-1
		
		
		}
	}
} else{
	speed=0
}

