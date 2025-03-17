var dt=delta_time/100000;



if(place_meeting(x,y,objPlayer) and objDimensions.currentdimension==2 and !encounter) {
	encounter=true;

	objDimensions.maxcd=20;
	objPlayer.hitpoints = objPlayer.maxhitpoints
	stage =1;	
	ds_list_add(tocreate2, [spawnx[0],spawny[0],objSlimeBall]);
	ds_list_add(tocreate2, [spawnx[1],spawny[0],objSlimeBall]);
	ds_list_add(tocreate2, [spawnx[0],spawny[1],objSlimeBall]);
	ds_list_add(tocreate2, [spawnx[1],spawny[1],objSlimeBall]);
}


if(stage==1){
	
	#region stage1
		slimecd-=dt
		if(slimecd<=0) {
			ds_list_add(tocreate2, [spawnx[irandom_range(0,1)],spawny[irandom_range(0,1)],objSlimeBall]);
			slimecd=slimecdmax;
		}
	
		wizardcd-=dt
		if(wizardcd<=0) {
			ds_list_add(tocreate2, [spawnx[irandom_range(0,1)],spawny[irandom_range(0,1)],objWizard]);
			wizardcd=wizardcdmax;
		}
		if(objBoss.hp<=objBoss.maxhp*3/4) {
			stage=2;
			maxprogress=timer1max
			progress=maxprogress
			open=true;
			randomize()
			color = irandom_range(0,1);
			objWireInterior.image_blend=colors[color]
			ds_list_add(tocreate1notaggro, [3504,752,objSlime]);
			ds_list_add(tocreate1notaggro, [3456,764,objSlime]);
			ds_list_add(tocreate1notaggro, [3412,772,objSlime]);
			//ds_list_add(tocreate1, [3292,772,objFairy]);
			ds_list_add(tocreate1notaggro, [3368,532,objFungant]);
		
			while(ds_list_size(objBoss.spikes) >0) {
				var currentspike = objBoss.spikes[| 0]
				ds_list_delete(objBoss.spikes, 0);
				instance_destroy(currentspike);
			}
			if(instance_exists(objBoss.laser))instance_destroy(objBoss.laser);
			if(instance_exists(objBoss.laser3))instance_destroy(objBoss.laser3);
			if(instance_exists(objBoss.laser2))instance_destroy(objBoss.laser2);
			objBoss.x = 3848
			objBoss.y = 768
			objBoss.movecd = objBoss.maxmovecd;
			objBoss.sprite_index = sprBossShielded;
		
			//for(var i = 0; i < ds_list_size(enemies2); i++){
			//	instance_destroy(enemies2[| i]);
			//	ds_list_delete(enemies2, i);
			//	i--;
			//}
		}
	#endregion
	
} else if(stage==2) {
	
	#region stage2
		progress-=dt;
		for(var i = 0; i < array_length(buttons); i++){
			if(buttons[i].pressed == true){
				if(color != i) objPlayer.hitpoints=0;
				else {
					if(color ==0 or color==1){
						objPlayer.x=3666
						objPlayer.y = 770
						with(objDimensions){
							alarm_set(0, 1);
							alarm_set(2, 5/dt);
							flashAlpha=.75;
							cd=maxcd;
						}
						#region delete enemies
							while(ds_list_size(enemies1) > 0){
								var currentenemy = enemies1[| 0]
								ds_list_delete(enemies1, 0);
								instance_destroy(currentenemy);
							}
							while(ds_list_size(objEncounter41.enemies1) > 0){
								var currentenemy = objEncounter41.enemies1[| 0]
								ds_list_delete(objEncounter41.enemies1, 0);
								instance_destroy(currentenemy);
							}
							while(ds_list_size(objEncounter41.enemies2) > 0){
								var currentenemy = objEncounter41.enemies2[| 0]
								ds_list_delete(objEncounter41.enemies2, 0);
								instance_destroy(currentenemy);
							}
							while(ds_list_size(enemies2) > 0){
								var currentenemy = enemies2[| 0]
								ds_list_delete(enemies2, 0);
								instance_destroy(currentenemy);
							}
						#endregion
						stage = 3;
					
					}
				}
			}
		}
		if(progress<=0) objPlayer.hitpoints=0;
	#endregion
	
} else if (stage == 3) {
	
	#region stage3

		if(open and place_meeting(x, y, objPlayer)){
			open = false;
			show_debug_message(2)
			ds_list_add(tocreate2, [spawnx[0],spawny[0],objSlimeBall]);
			ds_list_add(tocreate2, [spawnx[1],spawny[0],objSlimeBall]);
			ds_list_add(tocreate2, [spawnx[0],spawny[1],objSlimeBall]);
			ds_list_add(tocreate2, [spawnx[1],spawny[1],objSlimeBall]);
		}
		if(open){
			slimecd=70;
			wizardcd=110;
			wizardcdmax=110
			slimecdmax=60;
			slimecd-=dt
			if(slimecd<=0) {
				ds_list_add(tocreate2, [spawnx[irandom_range(0,1)],spawny[irandom_range(0,1)],objSlimeBall]);
				slimecd=slimecdmax;
			}
	
			wizardcd-=dt
			if(wizardcd<=0) {
				ds_list_add(tocreate2, [spawnx[irandom_range(0,1)],spawny[irandom_range(0,1)],objWizard]);
				wizardcd=wizardcdmax;
			}
		}
	#endregion
	
}

#region Creation
	if(objDimensions.currentdimension==1 and encounter){
		for(var i = 0; i < ds_list_size(tocreate1); i++){
			
			var instance= instance_create_layer(tocreate1[| i][0],tocreate1[| i][1],"Instances1",tocreate1[| i][2])
			var collide =false;
			with (instance) if place_meeting(x,y,[objPlayer,objEnemyParent1]) collide=true;
			if(!collide){
				with(instance){
					timercd=1.5;
					image_alpha=0;
					image_blend=c_white;
					aggro=false;
					active=true;
				}
				ds_list_add(enemies1,instance);
				ds_list_delete(tocreate1,i);
				i--;
			} else {
				instance_destroy(instance)
			}
			objDimensions.cd=objDimensions.maxcd/2
		}
	}
	if(objDimensions.currentdimension==2 and encounter){
		for(var i = 0; i < ds_list_size(tocreate2); i++){
			
			var instance= instance_create_layer(tocreate2[| i][0],tocreate2[| i][1],"Instances2",tocreate2[| i][2])
			var collide =false;
			with (instance) if place_meeting(x,y,[objPlayer,objEnemyParent2]) collide=true;
			if(!collide){
				with(instance){
					timercd=1.5;
					image_alpha=0;
					image_blend=c_white;
					aggro=false;
					active=true;
				}
				ds_list_add(enemies2,instance);
				ds_list_delete(tocreate2,i);
				i--;
			} else {
				instance_destroy(instance)
			}
			objDimensions.cd=objDimensions.maxcd/2
		}
	}
#endregion

#region Non aggro creation
	if(objDimensions.currentdimension==1 and encounter){
		for(var i = 0; i < ds_list_size(tocreate1notaggro); i++){
			
			var instance= instance_create_layer(tocreate1notaggro[| i][0],tocreate1notaggro[| i][1],"Instances1",tocreate1notaggro[| i][2])
			var collide =false;
			with (instance) if place_meeting(x,y,[objPlayer,objEnemyParent1]) collide=true;
			if(!collide){
				with(instance){
					image_blend=c_white;
					aggro=false;
					active=true;
				}
				ds_list_add(enemies1,instance);
				ds_list_delete(tocreate1notaggro,i);
				i--;
			} else {
				instance_destroy(instance)
			}
			objDimensions.cd=objDimensions.maxcd/2
		}
	}
	if(objDimensions.currentdimension==2 and encounter){
		for(var i = 0; i < ds_list_size(tocreate2notaggro); i++){
			
			var instance= instance_create_layer(tocreate2notaggro[| i][0],tocreate2notaggro[| i][1],"Instances2",tocreate2notaggro[| i][2])
			var collide =false;
			with (instance) if place_meeting(x,y,[objPlayer,objEnemyParent2]) collide=true;
			if(!collide){
				with(instance){
					image_blend=c_white;
					aggro=false;
					active=true;
				}
				ds_list_add(enemies2,instance);
				ds_list_delete(tocreate2notaggro,i);
				i--;
			} else {
				instance_destroy(instance)
			}
			objDimensions.cd=objDimensions.maxcd/2
		}
	}
#endregion


//if(progress<=0) objPlayer.hitpoints = 0;