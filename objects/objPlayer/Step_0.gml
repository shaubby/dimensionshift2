var dt = delta_time/100000;
//Inputs

keyRight = keyboard_check(ord("D"));
keyLeft = keyboard_check(ord("A"));
keyUp = keyboard_check(ord("W"));
keyDown = keyboard_check(ord("S"));



spd = 11.5*dt;

// Movement
inputDirection = point_direction(0, 0, keyRight - keyLeft, keyDown - keyUp);
inputMagnitude = (keyRight - keyLeft != 0) || (keyDown - keyUp != 0);
vx = lengthdir_x(spd * inputMagnitude, inputDirection);
vy = lengthdir_y(spd * inputMagnitude, inputDirection);



if(objDimensions.currentdimension==1){
	if(place_meeting(x+vx, y,  objParentSolid1)){
		vx = 0;
	}

	if(place_meeting(x, y+vy, objParentSolid1)) {
		vy= 0;
	}

	if(place_meeting(x+vx, y+vy, objParentSolid1)){
		vx = 0;
		vy = 0;
	}
	
	// Collision Depths
	var collision = ds_list_create();
	
	with(hitbox)instance_place_list(x,y,objGrasses, collision, true);
	for(var i=0; i < ds_list_size(collision); i++){
		
		if(hitbox.x>collision[| i].x){
			collision[| i].image_angle=15;
			
		}else{
			collision[| i].image_angle=-15;

		}
	}
	
}
if(objDimensions.currentdimension==2){
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
	
	// Collision Depths
	var collision = ds_list_create();
	
	with(hitbox)instance_place_list(x,y,objHitbox2, collision, true);
	for(var i=0; i < ds_list_size(collision); i++){
		
		if(y>collision[| i].y){
			collision[| i].object.depth=depth+5;
			
		} else {
			collision[| i].object.depth=depth-5;

		}
	}
}

if(hit){
	if(flashcd<=0){
		//if image_alpha==.3 image_alpha=1;
		//else image_alpha=.3;
		flashcd=flashrate
	}
	hitcd-=dt;
	flashcd-=dt;
	if(hitcd<=0){
		hit=false;
		//image_alpha=1;
	}
	image_index=1;
} else image_index=0;

if(healthmeter1 >=100 and healthmeter2>=100 and hitpoints <= maxhitpoints-2) {
	hitpoints+=2;
	healthmeter1=0
	healthmeter2=0
	greenFlashAlpha=.125
}

y += vy;
x += vx;
depth=9300-hitbox.y;
// Sprite

if(mouse_x>x) image_xscale=1;
else image_xscale=-1;

