hitbox = instance_create_layer(x,y,"Instances1",objPlayerHitbox)

hp=100
maxhp=100
hitlength=5;
hitcd=0;
flashcd=0;
flashrate=4;
hit=false;
redFlashAlpha=0;
hitpoints=16;
maxhitpoints=16;

healthmeter1 = 0
healthmeter2 = 0
greenFlashAlpha=0;

function takeHit(){
	hit=true;
	hitcd=hitlength;
	//image_alpha=.3;
	flashcd=flashrate;
	flashing=true
	redFlashAlpha=0.25;
	hitpoints-=2
}
function invincible(){
	hit=true;
	hitcd=10;
	//image_alpha=.3;
	flashcd=flashrate;
	flashing=true
}
