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
			var dir = point_direction(x, y, objPlayer.x, objPlayer.y-8);
			#region fireball
				if(fireball == -1000) {
					fireball = instance_create_layer(x +lengthdir_x(20, dir),y-8+lengthdir_y(20,dir), "Instances2", objFireball1);
					fireball.dir=dir
					fireball.spd=10
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
			#endregion
			#region fireball2
				if(fireball2 == -1000) {
					fireball2 = instance_create_layer(x +lengthdir_x(20, dir+40),y-8+lengthdir_y(20,dir+40), "Instances2", objFireball1);
					fireball2.dir=dir
					fireball2.spd=10
					fireball2.time=30
					fireball2.dmg=10
					fireball2.image_angle=dir
					fireball2.depth=depth-1;
				}
				if(instance_exists(fireball2) and fireball2.image_index==3){
					cd=random_range(mincd, maxcd)
					fireball2 = -1000
				} else if (!instance_exists(fireball2)){
					cd=random_range(mincd, maxcd)
					fireball2 = -1000
				}
			#endregion
			#region fireball3
				if(fireball3 == -1000) {
					fireball3 = instance_create_layer(x +lengthdir_x(20, dir-40),y-8+lengthdir_y(20,dir-40), "Instances2", objFireball1);
					fireball3.dir=dir
					fireball3.spd=10
					fireball3.time=30
					fireball3.dmg=10
					fireball3.image_angle=dir
					fireball3.depth=depth-1;
				}
				if(instance_exists(fireball3) and fireball3.image_index==3){
					cd=random_range(mincd, maxcd)
					fireball3 = -1000
				} else if (!instance_exists(fireball3)){
					cd=random_range(mincd, maxcd)
					fireball3 = -1000
				}
			#endregion
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

