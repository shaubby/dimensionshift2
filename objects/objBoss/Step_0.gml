event_inherited();



if(active) {
	if(aggro){
		
		var collision = ds_list_create();
	
	
		if(!kb){
			var dt = delta_time/100000;
			if(!objEncounter4.open){
				objBoss.sprite_index = sprBoss;
				movecd -=dt;
				if(movecd > 0){
					currentmove = -1;
					mp_potential_settings(20,10,3,true)
					mp_potential_step_object(objPlayerHitbox.x, objPlayerHitbox.y, dt*spd, objEnemyAvoidance2)
				} else {
					
					if(currentmove == -1) {randomize(); currentmove = irandom_range(0,1);}
					if(currentmove == 0) {
						#region spikes
							if(ds_list_size(spikes)==0){
								ds_list_add(spikes, instance_create_layer(x + lengthdir_x(32, point_direction(x, y-22, objPlayerHitbox.x, objPlayerHitbox.y)), y-22 + lengthdir_y(32, point_direction(x, y-22, objPlayerHitbox.x, objPlayerHitbox.y)), "Instances2", objBossProjectile));
								ds_list_add(spikes, instance_create_layer(x + lengthdir_x(32, point_direction(x, y-22, objPlayerHitbox.x, objPlayerHitbox.y)+20), y-22 + lengthdir_y(32, point_direction(x, y-22, objPlayerHitbox.x, objPlayerHitbox.y)+20), "Instances2", objBossProjectile));
								ds_list_add(spikes, instance_create_layer(x + lengthdir_x(32, point_direction(x, y-22, objPlayerHitbox.x, objPlayerHitbox.y)-20), y-22 + lengthdir_y(32, point_direction(x, y-22, objPlayerHitbox.x, objPlayerHitbox.y)-20), "Instances2", objBossProjectile));
								ds_list_add(spikes, instance_create_layer(x + lengthdir_x(32, point_direction(x, y-22, objPlayerHitbox.x, objPlayerHitbox.y)+40), y-22 + lengthdir_y(32, point_direction(x, y-22, objPlayerHitbox.x, objPlayerHitbox.y)+40), "Instances2", objBossProjectile));
								ds_list_add(spikes, instance_create_layer(x + lengthdir_x(32, point_direction(x, y-22, objPlayerHitbox.x, objPlayerHitbox.y)-40), y-22 + lengthdir_y(32, point_direction(x, y-22, objPlayerHitbox.x, objPlayerHitbox.y)-40), "Instances2", objBossProjectile));
								spikes[| 0].offset = 0
								spikes[| 1].offset = 20
								spikes[| 2].offset = -20
								spikes[| 3].offset = 40
								spikes[| 4].offset = -40
								//ds_list_add(spikes, instance_create_layer(x + lengthdir_x(32, point_direction(x, y-22, objPlayerHitbox.x, objPlayerHitbox.y)+80), y-22 + lengthdir_y(32, point_direction(x, y-22, objPlayerHitbox.x, objPlayerHitbox.y)+80), "Instances2", objBossProjectile));
								//ds_list_add(spikes, instance_create_layer(x + lengthdir_x(32, point_direction(x, y-22, objPlayerHitbox.x, objPlayerHitbox.y)-80), y-22 + lengthdir_y(32, point_direction(x, y-22, objPlayerHitbox.x, objPlayerHitbox.y)-80), "Instances2", objBossProjectile));
								//ds_list_add(spikes, instance_create_layer(x + lengthdir_x(32, point_direction(x, y-22, objPlayerHitbox.x, objPlayerHitbox.y)+100), y-22 + lengthdir_y(32, point_direction(x, y-22, objPlayerHitbox.x, objPlayerHitbox.y)+100), "Instances2", objBossProjectile));
								//ds_list_add(spikes, instance_create_layer(x + lengthdir_x(32, point_direction(x, y-22, objPlayerHitbox.x, objPlayerHitbox.y)-100), y-22 + lengthdir_y(32, point_direction(x, y-22, objPlayerHitbox.x, objPlayerHitbox.y)-100), "Instances2", objBossProjectile));
								spikescd= spikesmaxcd;
							}
							spikescd-=dt;
							if(spikescd <=0){
								for(var i = 0; i < ds_list_size(spikes); i++) spikes[| i].shoot=true;
								movecd=random_range(minmovecd, maxmovecd);
							}
						#endregion
					} else if (currentmove == 1){
						if(laserstimer == -1000 and laser3 == -1000){
							laserstimer = laserstimermax
						}
						laserstimer-=dt
						
						#region laser1
							if(laserstimer <= laserstimermax*2/3 and !instance_exists(laser) and !instance_exists(laser2) and !instance_exists(laser3)) {
								laser=instance_create_layer(objPlayerHitbox.x+objPlayer.vx*random_range(predictivemin, predictivemax),objPlayerHitbox.y-8+objPlayer.vy*random_range(predictivemin, predictivemax),"Instances2",objLaser_1);
								show_debug_message(1)
								laser.image_speed=1;
								laser.visible=true;
								laser.active=true;
								laser.owner=self;
							} else if (instance_exists(laser) and laser.image_index ==9) {
								if(lasercd == -1000){
									lasercd = lasercdmax
									laser.image_speed = 0;
								}
								lasercd-=dt;
								if(lasercd <=0){
									instance_destroy(laser)

									lasercd = -1000;
									laser = -1000;
								}
							}
						#endregion
						
						#region laser2
							if(laserstimer <= laserstimermax*1/3 and !instance_exists(laser2) and !instance_exists(laser3)) {
								laser2=instance_create_layer(objPlayerHitbox.x+objPlayer.vx*random_range(predictivemin, predictivemax),objPlayerHitbox.y-8+objPlayer.vy*random_range(predictivemin, predictivemax),"Instances2",objLaser_1);
								show_debug_message(2)
								laser2.image_speed=1;
								laser2.visible=true;
								laser2.active=true;
								laser2.owner=self;
							} else if (instance_exists(laser2) and laser2.image_index ==9) {
								if(laser2cd == -1000){
									laser2cd = lasercdmax
									laser2.image_speed = 0;
								}
								laser2cd-=dt;
								if(laser2cd <=0){
									instance_destroy(laser2)

									laser2cd = -1000;
									laser2 = -1000;
								}
							}
						#endregion
						
						
						#region laser3
							if(laserstimer <= 0 and !instance_exists(laser3)) {
								laser3=instance_create_layer(objPlayerHitbox.x+objPlayer.vx*random_range(predictivemin, predictivemax),objPlayerHitbox.y-8+objPlayer.vy*random_range(predictivemin, predictivemax),"Instances2",objLaser_1);
								show_debug_message(3)
								laser3.image_speed=1;
								laser3.visible=true;
								laser3.active=true;
								laser3.owner=self;
							} else if (instance_exists(laser3) and laser3.image_index ==9) {
								if(laser3cd == -1000){
									laser3cd = lasercdmax
									laser3.image_speed = 0;
								}
								laser3cd-=dt;
								if(laser3cd <=0){
									instance_destroy(laser3)

									laser3cd = -1000;
									laser3 = -1000;
									laserstimer = -1000;
									movecd=random_range(minmovecd, maxmovecd);
								}
							}
						#endregion
						
						
					}
				}
				for(var i = 0; i < ds_list_size(spikes); i++){
					if(!instance_exists(spikes[| i])){
						ds_list_delete(spikes, i);
						i--;
					}
				}
			} else {
				objBoss.sprite_index = sprBossShielded;
			}
			if(point_direction(x,y, objPlayerHitbox.x, objPlayerHitbox.y)<90 or point_direction(x,y, objPlayerHitbox.x, objPlayerHitbox.y)>270) image_xscale=1;
			else image_xscale=-1;
			
			if(place_meeting(x,y,objPlayerHitbox) and !objPlayer.hit){
				objPlayer.takeHit();
				objPlayer.hp-=20;
				knockback(kblength,point_direction(objPlayerHitbox.x,objPlayerHitbox.y,x,y),kbspd);
			}
		}
	}
	depth=9300-y
}

