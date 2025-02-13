event_inherited();

if(active) {
	if(aggro) {
		var collision = ds_list_create();
		if(instance_exists(gun)){
		instance_place_list(x,y,objHitbox2, collision, true);
			for(var i=0; i < ds_list_size(collision); i++){
		
				if(y>collision[| i].y){
					depth=collision[| i].object.depth-1
					gun.depth=self.depth-1;
			
				}else{
					depth=collision[| i].object.depth+1
					gun.depth=self.depth-1;
				}
			}
		}
		if(!kb){
			var dt = delta_time/100000;
			if(instance_exists(gun)){
				if(gun.collisionline){
					if(sprite_index==sprLancelotIdle) sprite_index=sprLancelotRun;
					mp_potential_step_object(objPlayer.x, objPlayer.y, dt*spd, objEnemyAvoidance2);
				} else {
					if(sprite_index==sprLancelotRun) sprite_index=sprLancelotIdle;
					mp_potential_step_object(objPlayer.x, objPlayer.y, dt*walkspd, objEnemyAvoidance2);
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

