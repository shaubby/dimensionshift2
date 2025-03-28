var dt = delta_time/100000;
var stepspd = spd*dt;

vx = lengthdir_x(stepspd, dir);
vy = lengthdir_y(stepspd, dir);
x+=vx
y+=vy
time -=dt;
if(objDimensions.currentdimension==1){
	if(time <=0 or place_meeting(x, y ,objBulletProof1)) instance_destroy(self)
	var enemy = instance_place(x, y, [objEnemyParent1,objFlyingEnemyParent1]);
	if(enemy){
		if(instance_exists(objEncounter3) and objEncounter3.encounter) objEncounter3.progress+=5;
		if(!enemy.death) {
			if(objDimensions.difficulty == 1) {
				objPlayer.healthmeter1 = min(objPlayer.healthmeter1+10, 100);
			} else if(objDimensions.difficulty == 2) {
				objPlayer.healthmeter1 = min(objPlayer.healthmeter1+15, 100);
			}
			
			
			if(instance_exists(objEncounter3) and objEncounter3.encounter) objEncounter3.progress+=5;
		}
		enemy.hp-=dmg
		enemy.knockback(enemy.kblength, dir, enemy.kbspd);
		
		instance_destroy(self)
	}

}
if(objDimensions.currentdimension==2){
	if(time <=0 or place_meeting(x, y ,objBulletProof2)) instance_destroy(self)
	var enemy = instance_place(x, y, [objEnemyParent2]);
	
	if(enemy){
		audio_play_sound(sndEnemyHit, 1, false)
		if(!enemy.death){
			if(variable_instance_exists(enemy, "boss")){
				if(objDimensions.difficulty == 1) {
					objPlayer.healthmeter1 = min(objPlayer.healthmeter1+10, 100);
				} else if(objDimensions.difficulty == 2) {
					objPlayer.healthmeter1 = min(objPlayer.healthmeter1+15, 100);
				}
			} else {
				if(objDimensions.difficulty == 1) {
					objPlayer.healthmeter2 = min(objPlayer.healthmeter2+10, 100);
				} else if(objDimensions.difficulty == 2) {
					objPlayer.healthmeter2 = min(objPlayer.healthmeter2+15, 100);
				}
			}
			if(instance_exists(objEncounter3) and objEncounter3.encounter) objEncounter3.progress+=5;
		}
		if(enemy.sprite_index != sprBossShielded){
			enemy.hp-=dmg
			if(enemy.sprite_index != sprBoss){
				enemy.knockback(enemy.kblength, dir, enemy.kbspd);
			}
		}
		
		
		instance_destroy(self)
	}

}
depth=9300-y-3