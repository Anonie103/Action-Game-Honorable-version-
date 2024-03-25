//variables for movements
moveDir = 0;
moveSpd = 8;
xspd = 0;
yspd = 0;

//sprite control 
centerYOffset = -2;
centerY = y + centerYOffset;//set in step event

weaponOffestDist = 4;
aimDir = 0;

face = 3;
sprite[0] = spr_right;
sprite[1] = spr_back ;
sprite[2] = spr_left ;
sprite[3] = spr_front;


//weapon info 
    shootTimer =0;
	shootCooldown = 9;

   bulletObj = obj_flenceBullet;
   weaponLength = sprite_get_bbox_right(spr_pewpew) - sprite_get_xoffset(spr_pewpew);
