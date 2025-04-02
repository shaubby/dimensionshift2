var dt=delta_time/100000;



if(place_meeting(x,y,objPlayer) and objDimensions.currentdimension==2 and stage!=8 and !encounter) {
	encounter=true;

	objDimensions.maxcd=20;
	objPlayer.hitpoints = objPlayer.maxhitpoints
	stage =1;	
	ds_list_add(tocreate2, [spawnx[0],spawny[0],objSlimeBall]);
	ds_list_add(tocreate2, [spawnx[1],spawny[0],objSlimeBall]);
	//ds_list_add(tocreate2, [spawnx[0],spawny[1],objSlimeBall]);
	//ds_list_add(tocreate2, [spawnx[1],spawny[1],objSlimeBall]);
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
			objPlayer.hitpoints=objPlayer.maxhitpoints;
			stage=2;
			maxprogress=timer1max
			progress=maxprogress
			open=true;
			randomize()
			var rand = irandom_range(0,ds_list_size(colorlist)-1);
			color = colorlist[| rand];
			objWireInterior.image_blend=colors[color]
			if(rand mod 2 == 0){
				ds_list_delete(colorlist, rand);
				ds_list_delete(colorlist, rand);
			} else {
				ds_list_delete(colorlist, rand-1);
				ds_list_delete(colorlist, rand-1);
			}
			if(color ==0 or color==1){
				objWires.image_index=1
			} else if (color ==2 or color == 3){
				objWires.image_index=3
			} else {
				objWires.image_index=2
			} 
			objPopup.popup=7;
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
			objBoss.laser = -1000;
			objBoss.lasercd = -1000;
			objBoss.laser2 = -1000;
			objBoss.laser2cd = -1000;
			objBoss.laser3 = -1000;
			objBoss.laser3cd = -1000;
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
			if(instance_exists(buttons[i]) and buttons[i].pressed == true){
				if(color != i) objPlayer.hitpoints=0;
				else {
					if(color ==0 or color==1){
						objPlayer.x=3666
						objPlayer.y = 770
					} else if (color ==2 or color == 3){
						objPlayer.x=4030
						objPlayer.y = 774
					} else {
						objPlayer.x=3848
						objPlayer.y = 600
					}
					objPopup.popup=0;
					with(objDimensions){
						alarm_set(0, 1);
						alarm_set(2, 5/dt);
						flashAlpha=.75;
						cd=maxcd;
					}
					objPlayer.hitpoints=objPlayer.maxhitpoints;
					#region delete enemies
						while(ds_list_size(enemies1) > 0){
							var currentenemy = enemies1[| 0]
							ds_list_delete(enemies1, 0);
							if(instance_exists(currentenemy)){currentenemy.hp=0; currentenemy.knockback(currentenemy.kblength, 0, currentenemy.kbspd);}
						}
						while(ds_list_size(objEncounter41.enemies1) > 0){
							var currentenemy = objEncounter41.enemies1[| 0]
							ds_list_delete(objEncounter41.enemies1, 0);
							if(instance_exists(currentenemy)){currentenemy.hp=0; currentenemy.knockback(currentenemy.kblength, 0, currentenemy.kbspd);}
						}
						while(ds_list_size(objEncounter41.enemies2) > 0){
							var currentenemy = objEncounter41.enemies2[| 0]
							ds_list_delete(objEncounter41.enemies2, 0);
							if(instance_exists(currentenemy)){currentenemy.hp=0; currentenemy.knockback(currentenemy.kblength, 0, currentenemy.kbspd);}
						}
						while(ds_list_size(objEncounter42.enemies1) > 0){
							var currentenemy = objEncounter42.enemies1[| 0]
							ds_list_delete(objEncounter42.enemies1, 0);
							if(instance_exists(currentenemy)){currentenemy.hp=0;}
						}
						while(ds_list_size(objEncounter42.enemies2) > 0){
							var currentenemy = objEncounter42.enemies2[| 0]
							ds_list_delete(objEncounter42.enemies2, 0);
							if(instance_exists(currentenemy)){currentenemy.hp=0; currentenemy.knockback(currentenemy.kblength, 0, currentenemy.kbspd);}
						}
						while(ds_list_size(objEncounter43.enemies1) > 0){
							var currentenemy = objEncounter43.enemies1[| 0]
							ds_list_delete(objEncounter43.enemies1, 0);
							if(instance_exists(currentenemy)){currentenemy.hp=0; currentenemy.knockback(currentenemy.kblength, 0, currentenemy.kbspd);}
						}
						while(ds_list_size(objEncounter43.enemies2) > 0){
							var currentenemy = objEncounter43.enemies2[| 0]
							ds_list_delete(objEncounter43.enemies2, 0);
							if(instance_exists(currentenemy)){currentenemy.hp=0; currentenemy.knockback(currentenemy.kblength, 0, currentenemy.kbspd);}
						}
						while(ds_list_size(enemies2) > 0){
							var currentenemy = enemies2[| 0]
							ds_list_delete(enemies2, 0);
							if(instance_exists(currentenemy)){currentenemy.hp=0; currentenemy.knockback(currentenemy.kblength, 0, currentenemy.kbspd);}
						}
					#endregion
					stage = 3;
					
					
				}
			}
		}
		if(progress<=0) objPlayer.hitpoints=0;
	#endregion
	
} else if (stage == 3) {
	
	#region stage3
		objWires.image_index=0;
		if(open and place_meeting(x, y, objPlayer)){
			open = false;
			show_debug_message(2)
			ds_list_add(tocreate2, [spawnx[0],spawny[0],objSlimeBall]);
			ds_list_add(tocreate2, [spawnx[1],spawny[0],objSlimeBall]);
			ds_list_add(tocreate2, [spawnx[0],spawny[1],objSlimeBall]);
			ds_list_add(tocreate2, [spawnx[1],spawny[1],objSlimeBall]);
		}
		if(open){
			slimecd=60;
			wizardcd=110;
			wizardcdmax=100
			slimecdmax=50;
		}
		slimecd-=dt
		show_debug_message(slimecd)
		if(slimecd<=0) {
			ds_list_add(tocreate2, [spawnx[irandom_range(0,1)],spawny[irandom_range(0,1)],objSlimeBall]);
			slimecd=slimecdmax;
		}
	
		wizardcd-=dt
		if(wizardcd<=0) {
			ds_list_add(tocreate2, [spawnx[irandom_range(0,1)],spawny[irandom_range(0,1)],objWizard]);
			wizardcd=wizardcdmax;
		}

		if(objBoss.hp<=objBoss.maxhp*1/2) {
			objPlayer.hitpoints=objPlayer.maxhitpoints
			stage=4;
			maxprogress=timer1max
			progress=maxprogress
			open=true;
			randomize()
			var rand = irandom_range(0,ds_list_size(colorlist)-1);
			color = colorlist[| rand];
			show_debug_message(color)
			objWireInterior.image_blend=colors[color]
			if(color ==0 or color==1){
				objWires.image_index=1
			} else if (color ==2 or color == 3){
				objWires.image_index=3
			} else {
				objWires.image_index=2
			}
			objPopup.popup=7;
			if(rand mod 2 == 0){
				ds_list_delete(colorlist, rand);
				ds_list_delete(colorlist, rand);
			} else {
				ds_list_delete(colorlist, rand-1);
			}
				
			
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
			objBoss.laser = -1000;
			objBoss.lasercd = -1000;
			objBoss.laser2 = -1000;
			objBoss.laser2cd = -1000;
			objBoss.laser3 = -1000;
			objBoss.laser3cd = -1000;
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
	
} else if (stage==4) {
	#region stage4
		progress-=dt;
		for(var i = 0; i < array_length(buttons); i++){
			if(instance_exists(buttons[i]) and buttons[i].pressed == true){
				if(color != i) objPlayer.hitpoints=0;
				else {
					objPlayer.hitpoints=objPlayer.maxhitpoints;
					if(color ==0 or color==1){
						objPlayer.x=3666
						objPlayer.y = 770
					} else if (color ==2 or color == 3){
						objPlayer.x=4030
						objPlayer.y = 774
					} else {
						objPlayer.x=3848
						objPlayer.y = 600
					}
					objPopup.popup=0;
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
							if(instance_exists(currentenemy)){currentenemy.hp=0; currentenemy.knockback(currentenemy.kblength, 0, currentenemy.kbspd);}
						}
						while(ds_list_size(objEncounter41.enemies1) > 0){
							var currentenemy = objEncounter41.enemies1[| 0]
							ds_list_delete(objEncounter41.enemies1, 0);
							if(instance_exists(currentenemy)){currentenemy.hp=0; currentenemy.knockback(currentenemy.kblength, 0, currentenemy.kbspd);}
						}
						while(ds_list_size(objEncounter41.enemies2) > 0){
							var currentenemy = objEncounter41.enemies2[| 0]
							ds_list_delete(objEncounter41.enemies2, 0);
							if(instance_exists(currentenemy)){currentenemy.hp=0; currentenemy.knockback(currentenemy.kblength, 0, currentenemy.kbspd);}
						}
						while(ds_list_size(objEncounter42.enemies1) > 0){
							var currentenemy = objEncounter42.enemies1[| 0]
							ds_list_delete(objEncounter42.enemies1, 0);
							if(instance_exists(currentenemy)){currentenemy.hp=0; currentenemy.knockback(currentenemy.kblength, 0, currentenemy.kbspd);}
						}
						while(ds_list_size(objEncounter42.enemies2) > 0){
							var currentenemy = objEncounter42.enemies2[| 0]
							ds_list_delete(objEncounter42.enemies2, 0);
							if(instance_exists(currentenemy)){currentenemy.hp=0; currentenemy.knockback(currentenemy.kblength, 0, currentenemy.kbspd);}
						}
						while(ds_list_size(objEncounter43.enemies1) > 0){
							var currentenemy = objEncounter43.enemies1[| 0]
							ds_list_delete(objEncounter43.enemies1, 0);
							if(instance_exists(currentenemy)){currentenemy.hp=0; currentenemy.knockback(currentenemy.kblength, 0, currentenemy.kbspd);}
						}
						while(ds_list_size(objEncounter43.enemies2) > 0){
							var currentenemy = objEncounter43.enemies2[| 0]
							ds_list_delete(objEncounter43.enemies2, 0);
							if(instance_exists(currentenemy)){currentenemy.hp=0; currentenemy.knockback(currentenemy.kblength, 0, currentenemy.kbspd);}
						}
						while(ds_list_size(enemies2) > 0){
							var currentenemy = enemies2[| 0]
							ds_list_delete(enemies2, 0);
							if(instance_exists(currentenemy)){currentenemy.hp=0; currentenemy.knockback(currentenemy.kblength, 0, currentenemy.kbspd);}
						}
					#endregion
					stage = 5;
					
					
				}
			}
		}
		if(progress<=0) objPlayer.hitpoints=0;
	#endregion
} else if (stage == 5) {
	
	#region stage5
		objWires.image_index=0;
		if(open and place_meeting(x, y, objPlayer)){
			open = false;
			show_debug_message(2)
			ds_list_add(tocreate2, [spawnx[0],spawny[0],objSlimeBall]);
			ds_list_add(tocreate2, [spawnx[1],spawny[0],objSlimeBall]);
			ds_list_add(tocreate2, [spawnx[0],spawny[1],objSlimeBall]);
			ds_list_add(tocreate2, [spawnx[1],spawny[1],objSlimeBall]);
		}
		if(open){
			slimecd=60;
			wizardcd=100;
			wizardcdmax=80
			slimecdmax=50;
			objBoss.minmovecd = 11;
			objBoss.maxmovecd=12;
		}
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
		if(objBoss.hp<=objBoss.maxhp*1/4) {
			objPlayer.hitpoints=objPlayer.maxhitpoints
			stage=6;
			maxprogress=timer1max
			progress=maxprogress
			open=true;
			randomize()
			var rand = irandom_range(0,ds_list_size(colorlist)-1);
			color = colorlist[| rand];
			show_debug_message(color)
			objWireInterior.image_blend=colors[color]
			if(color ==0 or color==1){
				objWires.image_index=1
			} else if (color ==2 or color == 3){
				objWires.image_index=3
			} else {
				objWires.image_index=2
			}
			objPopup.popup=7;
			if(rand mod 2 == 0){
				ds_list_delete(colorlist, rand);
				ds_list_delete(colorlist, rand);
			} else {
				ds_list_delete(colorlist, rand-1);
			}
				
			
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
			objBoss.laser = -1000;
			objBoss.lasercd = -1000;
			objBoss.laser2 = -1000;
			objBoss.laser2cd = -1000;
			objBoss.laser3 = -1000;
			objBoss.laser3cd = -1000;
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
	
}else if (stage==6) {
	#region stage6
		progress-=dt;
		for(var i = 0; i < array_length(buttons); i++){
			if(instance_exists(buttons[i]) and buttons[i].pressed == true){
				if(color != i) objPlayer.hitpoints=0;
				else {
					objPlayer.hitpoints=objPlayer.maxhitpoints;
					if(color ==0 or color==1){
						objPlayer.x=3666
						objPlayer.y = 770
					} else if (color ==2 or color == 3){
						objPlayer.x=4030
						objPlayer.y = 774
					} else {
						objPlayer.x=3848
						objPlayer.y = 600
					}
					objPopup.popup=0;
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
							if(instance_exists(currentenemy)){currentenemy.hp=0; currentenemy.knockback(currentenemy.kblength, 0, currentenemy.kbspd);}
						}
						while(ds_list_size(objEncounter41.enemies1) > 0){
							var currentenemy = objEncounter41.enemies1[| 0]
							ds_list_delete(objEncounter41.enemies1, 0);
							if(instance_exists(currentenemy)){currentenemy.hp=0; currentenemy.knockback(currentenemy.kblength, 0, currentenemy.kbspd);}
						}
						while(ds_list_size(objEncounter41.enemies2) > 0){
							var currentenemy = objEncounter41.enemies2[| 0]
							ds_list_delete(objEncounter41.enemies2, 0);
							if(instance_exists(currentenemy)){currentenemy.hp=0; currentenemy.knockback(currentenemy.kblength, 0, currentenemy.kbspd);}
						}
						while(ds_list_size(objEncounter42.enemies1) > 0){
							var currentenemy = objEncounter42.enemies1[| 0]
							ds_list_delete(objEncounter42.enemies1, 0);
							if(instance_exists(currentenemy)){currentenemy.hp=0; currentenemy.knockback(currentenemy.kblength, 0, currentenemy.kbspd);}
						}
						while(ds_list_size(objEncounter42.enemies2) > 0){
							var currentenemy = objEncounter42.enemies2[| 0]
							ds_list_delete(objEncounter42.enemies2, 0);
							if(instance_exists(currentenemy)){currentenemy.hp=0; currentenemy.knockback(currentenemy.kblength, 0, currentenemy.kbspd);}
						}
						while(ds_list_size(objEncounter43.enemies1) > 0){
							var currentenemy = objEncounter43.enemies1[| 0]
							ds_list_delete(objEncounter43.enemies1, 0);
							if(instance_exists(currentenemy)){currentenemy.hp=0; currentenemy.knockback(currentenemy.kblength, 0, currentenemy.kbspd);}
						}
						while(ds_list_size(objEncounter43.enemies2) > 0){
							var currentenemy = objEncounter43.enemies2[| 0]
							ds_list_delete(objEncounter43.enemies2, 0);
							if(instance_exists(currentenemy)){currentenemy.hp=0; currentenemy.knockback(currentenemy.kblength, 0, currentenemy.kbspd);}
						}
						while(ds_list_size(enemies2) > 0){
							var currentenemy = enemies2[| 0]
							ds_list_delete(enemies2, 0);
							if(instance_exists(currentenemy)){currentenemy.hp=0; currentenemy.knockback(currentenemy.kblength, 0, currentenemy.kbspd);}
						}
					#endregion
					stage = 7;
					
					
				}
			}
		}
		if(progress<=0) objPlayer.hitpoints=0;
	#endregion
} else if (stage == 7){
	#region stage7
		objWires.image_index=0;
		if(open and place_meeting(x, y, objPlayer)){
			open = false;
			show_debug_message(2)
			ds_list_add(tocreate2, [spawnx[0],spawny[0],objSlimeBall]);
			ds_list_add(tocreate2, [spawnx[1],spawny[0],objSlimeBall]);
			ds_list_add(tocreate2, [spawnx[0],spawny[1],objSlimeBall]);
			ds_list_add(tocreate2, [spawnx[1],spawny[1],objSlimeBall]);
		}
		if(open){
			slimecd=50;
			wizardcd=100;
			wizardcdmax=80
			slimecdmax=50;
			objBoss.minmovecd = 7;
			objBoss.maxmovecd=9;
		}
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
		if(!instance_exists(objBoss)) {
			encounter=false;
			objWiresOver.image_index=1;
			while(ds_list_size(enemies1) > 0){
				var currentenemy = enemies1[| 0]
				ds_list_delete(enemies1, 0);
				if(instance_exists(currentenemy)){currentenemy.hp=0; currentenemy.knockback(currentenemy.kblength, 0, currentenemy.kbspd);}
			}
			stage=8;
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
					timed=false;
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
					timed=false;
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