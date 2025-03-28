event_inherited();



if(active) {
	var dt = delta_time/100000;
	if(aggro){
		
		var collision = ds_list_create();
		//show_debug_message(cd);
		if(collision_line(objPlayer.x + objPlayer.vx*(predictive),objPlayer.y-8 + objPlayer.vy*(predictive), x, y,objBulletProof2,false,true) ) {
				show_debug_message(1)
				mp_potential_settings(20,10,3,true)
				mp_potential_step_object(objPlayerHitbox.x, objPlayerHitbox.y, dt*spd, objEnemyAvoidance2)
				if(direction<90 or direction>270) image_xscale=1;
				else image_xscale=-1;
			
				
		} else if(cd>=0){
			if(!kb){
			
				//mp_potential_settings(20,10,3,true)
				//mp_potential_step_object(objPlayerHitbox.x, objPlayerHitbox.y, dt*spd, objEnemyAvoidance2)
				if(direction<90 or direction>270) image_xscale=1;
				else image_xscale=-1;
			
				
			}
			
		} else {
			
			if (cd > 0-shotlength){
				if(dir==-1000) {
					dir = point_direction(x,y, objPlayer.x + objPlayer.vx*(predictive),objPlayer.y-8 + objPlayer.vy*(predictive));
					sprite_index=sprDevil;
					shotlength = random_range(shotlengthmin, shotlengthmax)
				}
				vx = lengthdir_x(fastspd, dir);
				vy = lengthdir_y(fastspd, dir);
				if(dir<90 or dir>270) image_xscale=1;
				else image_xscale=-1;

				if(place_meeting(x+vx, y,  objParentSolid2)){
					vx = 0;
				}

				if(place_meeting(x, y+vy, objParentSolid2)) {
					vy= 0;
				}

				if(place_meeting(x+vx, y+vy, objParentSolid2)){
					vx = 0;
					vy = 0;
				}
				
				x+=vx*dt;
				y+=vy*dt;

			} else {
				dir = -1000;
				cd = random_range(mincd, maxcd);
				direct=point_direction(x,y,objPlayerHitbox.x,objPlayerHitbox.y);
				var projectile = instance_create_layer(x +lengthdir_x(4, direct),y+lengthdir_y(4,direct), "Instances2", objEnemyProjectile2);
				projectile.dir=self.direct
				projectile.spd=10
				projectile.time=100
				projectile.dmg=10
				projectile.image_angle=projectile.dir
				projectile.depth=depth-1;

				projectile = instance_create_layer(x +lengthdir_x(4, direct+20),y+lengthdir_y(4,direct+20), "Instances2", objEnemyProjectile2);
				projectile.dir=self.direct+20
				projectile.spd=10
				projectile.time=100
				projectile.dmg=10
				projectile.image_angle=projectile.dir
				projectile.depth=depth-1;

				projectile = instance_create_layer(x +lengthdir_x(4, direct-20),y+lengthdir_y(4,direct-20), "Instances2", objEnemyProjectile2);
				projectile.dir=self.direct-20
				projectile.spd=9
				projectile.time=100
				projectile.dmg=10
				projectile.image_angle=projectile.dir
				projectile.depth=depth-1;
				sprite_index=sprDevilIdle;
			}
			
		}
		if(place_meeting(x,y,objPlayerHitbox) and !objPlayer.hit){
				objPlayer.takeHit();
				objPlayer.hp-=20;
				knockback(kblength,point_direction(objPlayerHitbox.x,objPlayerHitbox.y,x,y),kbspd);
		}
		cd-=dt;
	}
	depth=9300-y
}

