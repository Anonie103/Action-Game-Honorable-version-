//get damage 
get_damage_create();

spd = 0; 
chaseSpd = 3;
dir = 0;
xspd = 0;
yspd = 0;

//state machine
state = 1;

cooldownTimer = 3*60;
shootTimer = irandom(cooldownTimer);
windupTime = 25;
recoverTime = 15;
bulletInst = noone;

bulletXoff = 5; 
bulletYoff = -8;