event_inherited();



if(active) {
	var dt = delta_time/100000;
	if(aggro){
		
		var collision = ds_list_create();
		//show_debug_message(cd);
		if(cd>=0){
			if(!kb){
			
				//mp_potential_settings(20,10,3,true)
				//mp_potential_step_object(objPlayerHitbox.x, objPlayerHitbox.y, dt*spd, objEnemyAvoidance2)
				if(direction<90 or direction>270) image_xscale=1;
				else image_xscale=-1;
			
				if(place_meeting(x,y,objPlayerHitbox) and !objPlayer.hit){
					objPlayer.takeHit();
					objPlayer.hp-=20;
					knockback(kblength,point_direction(objPlayerHitbox.x,objPlayerHitbox.y,x,y),kbspd);
				}
			}
			
		} else {
			
			var dir = point_direction(x, y, objPlayer.x, objPlayer.y-8);
			if(fireball == -1000) {
				fireball = instance_create_layer(x +lengthdir_x(14, dir),y-8+lengthdir_y(14,dir), "Instances2", objFireball);
				fireball.dir=dir
				fireball.spd=15
				fireball.time=30
				fireball.dmg=10
				fireball.image_angle=dir
				fireball.depth=depth-1;
			}
			if(instance_exists(fireball) and fireball.image_index==3){
				cd=random_range(mincd, maxcd)
				fireball = -1000
			} else if (!instance_exists(fireball)){
				cd=random_range(mincd, maxcd)
				fireball = -1000
			}
			
		}
		cd-=dt;
	}
	depth=9300-y
}

