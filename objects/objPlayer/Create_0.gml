hitbox = instance_create_layer(x,y,"Instances1",objPlayerHitbox)

hp=100
maxhp=100
hitlength=20;
hitcd=0;
flashcd=0;
flashrate=4;
hit=false;
redFlashAlpha=0;
hitpoints=20;
maxhitpoints=20;


function takeHit(){
	hit=true;
	hitcd=hitlength;
	image_alpha=.3;
	flashcd=flashrate;
	flashing=true
	redFlashAlpha=0.25;
	hitpoints-=1
}
function invincible(){
	hit=true;
	hitcd=15;
	image_alpha=.3;
	flashcd=flashrate;
	flashing=true
}
