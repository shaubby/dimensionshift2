event_inherited();
path = path_add();
spd=3
hp=150
kblength=2;
kbspd=10;
aura = instance_create_layer(x, y, "Instances2", objAura);
aura.owner = self
aggroSprite=sprFungiantRun;
maxcd = 30;
mincd = 20;
firerate = 2.25;

cd = random_range(0, 5)
fireball = -1000
fireball2 = -1000
fireball3 = -1000
