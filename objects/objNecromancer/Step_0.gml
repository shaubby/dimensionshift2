event_inherited();
var dt=delta_time/1000000

if(active and aggro) {
	var collision = ds_list_create();
	
	instance_place_list(x,y,objHitbox1, collision, true);
	if(!kb){
		var dt = delta_time/100000;
		if(cd >=0) {
			image_speed=1
			mp_potential_settings(30, 10, 50, true)
			mp_potential_step_object(objPlayerHitbox.x, objPlayerHitbox.y, dt*spd, objEnemyAvoidance1)
		} else {
			image_speed=0;
			image_index=0
			if(shotcd<=0){
				var dir = point_direction(x, y-8, objPlayerHitbox.x,  objPlayerHitbox.y-8);
				var projectile = instance_create_layer(x + lengthdir_x(4, dir), y - 8 + lengthdir_y(4, dir), "Instances1", objEnemyProjectile1);
				projectile.dir=dir
				projectile.spd=18
				projectile.time=100
				projectile.dmg=10
				projectile.image_angle=projectile.dir
				projectile.depth=depth-1;
				shotcd=firerate;
			}
			shotcd-=dt;
			if(cd<=0-shotlength) cd = random_range(mincd, maxcd);
			
		}
		if(direction<90 or direction>270) image_xscale=1;
		else image_xscale=-1
		if(place_meeting(x,y,objPlayerHitbox) and !objPlayer.hit){
			objPlayer.takeHit();
			objPlayer.hp-=20;
			knockback(kblength,point_direction(objPlayerHitbox.x,objPlayerHitbox.y,x,y),kbspd);
		}
		cd-=dt;
	}
	
}

